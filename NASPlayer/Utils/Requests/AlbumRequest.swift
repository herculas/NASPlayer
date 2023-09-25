//
//  AlbumRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import Foundation
import Combine

enum AlbumEndpoint: Endpoint {
    case list
    
    var baseUrl: String {
        return "server.herculas.net"
    }
    var port: Int {
        return 12803
    }
    var path: String {
        return "/webapi/AudioStation/album.cgi"
    }
    var method: HTTPMethod {
        return .get
    }
    var params: [URLQueryItem] {
        let params = [
            URLQueryItem(name: "_sid", value: "n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU"),
            URLQueryItem(name: "api", value: "SYNO.AudioStation.Album"),
            URLQueryItem(name: "library", value: "all"),
            URLQueryItem(name: "method", value: "list"),
            URLQueryItem(name: "version", value: "3"),
        ]
        return params
    }
    var headers: [String : String] {
        return [:]
    }
}

class AlbumRequest {
    private var requestable = NetworkRequestable()
    
    func albumListPublisher() -> AnyPublisher<Response<Albums>, NetworkError> {
        let endpoint = AlbumEndpoint.list
        let request = Request(endpoint: endpoint, timeout: 1000)
        return self.requestable.issue(request: request)
    }
}
