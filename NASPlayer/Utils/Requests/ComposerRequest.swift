//
//  ComposerRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import Foundation
import Combine

enum ComposerEndpoint: Endpoint {
case list(limit: Int?)
    
    var baseUrl: String { "server.herculas.net" }
    var port: Int { 12803 }
    var path: String { "/webapi/AudioStation/composer.cgi" }
    var method: HTTPMethod { .get }
    var headers: [String : String] { [:] }
    var params: [URLQueryItem] {
        var params = [
            URLQueryItem(name: "_sid", value: "n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU"),
            URLQueryItem(name: "api", value: "SYNO.AudioStation.Composer"),
            URLQueryItem(name: "method", value: "list"),
            URLQueryItem(name: "library", value: "all"),
            URLQueryItem(name: "version", value: "2"),
            URLQueryItem(name: "additional", value: "avg_rating"),
            URLQueryItem(name: "sort_by", value: "name"),
            URLQueryItem(name: "sort_direction", value: "asc"),
        ]
        switch self {
            case .list(let limit):
                if let limit = limit {
                    params.append(URLQueryItem(name: "limit", value: "\(limit)"))
                }
        }
        return params
    }
}

class ComposerRequest {
    private var requestable = NetworkRequestable()
    
    func composerListPublisher(limit: Int?) -> AnyPublisher<Response<Composers>, NetworkError> {
        let endpoint = ComposerEndpoint.list(limit: limit)
        let request = Request(endpoint: endpoint, timeout: 1000)
        return self.requestable.issue(request: request)
    }
}
