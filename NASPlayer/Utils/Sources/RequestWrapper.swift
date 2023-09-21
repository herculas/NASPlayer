//
//  Request.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import UIKit

final class RequestWrapper: NSObject, ObservableObject {
    
    @Published var isLoading: Bool = false
    
    func get(from url: String, on completion: @escaping(Data?, Error?, Bool) -> Void) {
        self.isLoading = true
        
        guard let url = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
              let url = URL(string: url) else {
            self.isLoading = false
            completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL."]), false)
            return
        }
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 3000000.0
        sessionConfig.timeoutIntervalForResource = 6000000.0
        
        let request = URLRequest(url: url)
        let session = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        
        session.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                DispatchQueue.main.async {
                    self.isLoading = false
                    completion(nil, error, false)
                }
                return
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
                completion(data, nil, false)
            }
        }
        .resume()
    }
    
    func get(from url: String, on completion: @escaping(UIImage?, Error?, Bool) -> Void) {
        self.isLoading = true
        
        guard let url = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
              let url = URL(string: url) else {
            self.isLoading = false
            completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL."]), false)
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("*/*", forHTTPHeaderField: "Accept")
        request.setValue("gzip, deflate, br", forHTTPHeaderField: "Accept-Encoding")
        request.setValue("keep-alive", forHTTPHeaderField: "Connection")
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        session.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    self.isLoading = false
                    completion(nil, error, false)
                }
                return
            }
            DispatchQueue.main.async {
                self.isLoading = false
                completion(image, nil, false)
            }
        }
        .resume()
    }
    
    func post(to url: String, with parameters: Dictionary<String, Any>, on completion: @escaping(Data?, Error?, Bool) -> Void) {
        self.isLoading = true
        
        guard let url = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
              let url = URL(string: url) else {
            self.isLoading = false
            completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL."]), false)
            return
        }
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 3000000.0
        sessionConfig.timeoutIntervalForResource = 6000000.0
        
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = parameters.percentEncoded()
        
        let session = URLSession(configuration: sessionConfig, delegate: self, delegateQueue: nil)
        
        session.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                DispatchQueue.main.async {
                    self.isLoading = false
                    completion(nil, error, false)
                }
                return
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
                completion(data, nil, false)
            }
        }
        .resume()
    }
}

extension RequestWrapper: URLSessionDelegate {
    public func urlSession(
        _ session: URLSession,
        didReceive challenge: URLAuthenticationChallenge,
        completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void
    ) {
        let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
        completionHandler(.useCredential, urlCredential)
    }
}
