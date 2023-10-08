//
//  Endpoint.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol Endpoint {
    var host: String { get }
    var port: Int { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var params: [URLQueryItem] { get }
}

extension Endpoint {
    func getUrl() -> URL? {
        var component = URLComponents()
        component.scheme = "https"
        component.host = self.host
        component.port = self.port
        component.path = self.path
        component.queryItems = self.params
        return component.url
    }
}
