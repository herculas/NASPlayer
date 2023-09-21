//
//  Request.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import Foundation

public struct Request {
    let endpoint: Endpoint
    let body: Data?
    let timeout: Float?
    
    init(endpoint: Endpoint, body: Data? = nil, timeout: Float? = nil) {
        self.endpoint = endpoint
        self.body = body
        self.timeout = timeout
    }
    
    func getUrlRequest() -> URLRequest? {
        guard let url = self.endpoint.getUrl() else {
            print("url not found.")
            return nil
        }
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = self.endpoint.method.rawValue
        self.endpoint.headers.forEach { request.addValue($0.key, forHTTPHeaderField: $0.value) }
        return request
    }
}
