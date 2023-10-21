//
//  Requestable.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import Combine
import UIKit

protocol Requestable {
    /// Default timeout for requests.
    var reqTimeout: Float { get }
    
    /// Default timeout for responses.
    var resTimeout: Float { get }
    
    /// Issues requests for simple JSON files.
    func issue<T: Codable>(request req: Request) -> AnyPublisher<Response<T>, NetworkError>
    
    /// Issues requests for images.
    func issue(request req: Request) -> AnyPublisher<UIImage, NetworkError>
}

class NetworkRequestable: NSObject, Requestable {
    var reqTimeout: Float = 30000
    var resTimeout: Float = 600000
    
    func issue<T: Codable>(request req: Request) -> AnyPublisher<Response<T>, NetworkError> {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(req.timeout ?? self.reqTimeout)
        sessionConfig.timeoutIntervalForResource = TimeInterval(self.resTimeout)
        let session = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        
        return session
            .dataTaskPublisher(for: req.getUrlRequest()!)
            .tryMap { (data: Data, response: URLResponse) in
                guard response is HTTPURLResponse else {
                    throw NetworkError.serverError(code: 0, error: "Server Error!")
                }
                return data
            }
            .decode(type: Response<T>.self, decoder: JSONDecoder())
            .tryMap { response in
                guard response.error == nil else {
                    print(response.error?.code ?? -1)
                    throw NetworkError.apiError(code: response.error?.code ?? 0, error: "\(response.error?.code ?? 0)")
                }
                return response
            }
            .mapError { error in
                NetworkError.invalidJson(String(describing: error))
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func issue(request req: Request) -> AnyPublisher<UIImage, NetworkError> {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(req.timeout ?? self.reqTimeout)
        sessionConfig.timeoutIntervalForResource = TimeInterval(self.resTimeout)
        let session = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        
        if let data = session.configuration.urlCache?.cachedResponse(for: req.getUrlRequest()!)?.data,
           let image = UIImage(data: data) {
//            print("load data from cache: \(String(describing: req.getUrlRequest()?.url))")
            return Just(image)
                .setFailureType(to: NetworkError.self)
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
        } else {
//            print("request data from network")
            return session
                .dataTaskPublisher(for: req.getUrlRequest()!)
                .tryMap { (data: Data, response: URLResponse) in
                    guard response is HTTPURLResponse else {
                        throw NetworkError.serverError(code: 0, error: "Response Error!")
                    }
                    guard let image = UIImage(data: data) else {
                        throw NetworkError.serverError(code: 0, error: "Image Parsing Error!")
                    }
                    return image
                }
                .mapError { error in
                    NetworkError.cannotParseData(String(describing: error))
                }
                .receive(on: RunLoop.main)
                .eraseToAnyPublisher()
        }
    }
}

extension NetworkRequestable: URLSessionDelegate {
    func urlSession(
        _ session: URLSession,
        didReceive challenge: URLAuthenticationChallenge,
        completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void
    ) {
        let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, credential)
    }
}
