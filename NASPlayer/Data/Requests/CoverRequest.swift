//
//  CoverRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 22/9/2023.
//

import UIKit
import Combine

enum CoverEndpoint: Endpoint {
    case album(title: String, artist: String)
    case song(id: String)
    
    var baseUrl: String {
        return "server.herculas.net"
    }
    var port: Int {
        return 12803
    }
    var path: String {
        return "/webapi/AudioStation/cover.cgi"
    }
    var method: HTTPMethod {
        return .get
    }
    
    var params: [URLQueryItem] {
        var params = [
            URLQueryItem(name: "_sid", value: "n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU"),
            URLQueryItem(name: "api", value: "SYNO.AudioStation.Cover"),
            URLQueryItem(name: "library", value: "all"),
        ]
        switch self {
        case .album(let title, let artist):
            params.append(URLQueryItem(name: "method", value: "getcover"))
            params.append(URLQueryItem(name: "album_name", value: title))
            params.append(URLQueryItem(name: "album_artist_name", value: artist))
            params.append(URLQueryItem(name: "version", value: "3"))
        case .song(let id):
            params.append(URLQueryItem(name: "method", value: "getsongcover"))
            params.append(URLQueryItem(name: "id", value: id))
            params.append(URLQueryItem(name: "version", value: "1"))
        }
        return params
    }
    
    var headers: [String : String] {
        return [:]
    }
}

class CoverRequest {
    private var requestable = NetworkRequestable()
    
    func songPublisher(id: String) -> AnyPublisher<UIImage, NetworkError> {
        let endpoint = CoverEndpoint.song(id: id)
        let request = Request(endpoint: endpoint, timeout: 50000)
        return self.requestable.issue(request: request)
    }
    
    func albumPublisher(title: String, artist: String) -> AnyPublisher<UIImage, NetworkError> {
        let endpoint = CoverEndpoint.album(title: title, artist: artist)
        let request = Request(endpoint: endpoint, timeout: 50000)
        return self.requestable.issue(request: request)
    }
}
