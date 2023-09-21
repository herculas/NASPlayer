//
//  Requestable.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import Combine
import Foundation

protocol Requestable {
    var reqTimeout: Float { get }
    var resTimeout: Float { get }
    func issue<T: Codable>(request req: Request) -> AnyPublisher<T, NetworkError>
}

class NetworkRequestable: NSObject, Requestable {
    var reqTimeout: Float = 30000
    var resTimeout: Float = 600000
    
    func issue<T: Codable>(request req: Request) -> AnyPublisher<T, NetworkError> {
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
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                NetworkError.invalidJson(String(describing: error))
            }
            .eraseToAnyPublisher()
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
