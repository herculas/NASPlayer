//
//  AlbumRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import Foundation
import Combine

enum AlbumEndpoint: Endpoint {
    case list(limit: Int?)
    case artist(artist: String)
    case composer(composer: String)
    
    var baseUrl: String { "server.herculas.net" }
    var port: Int { 12803 }
    var path: String { "/webapi/AudioStation/album.cgi" }
    var method: HTTPMethod { .get }
    var headers: [String : String] { [:] }
    var params: [URLQueryItem] {
        var params = [
            URLQueryItem(name: "_sid", value: "n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU"),
            URLQueryItem(name: "api", value: "SYNO.AudioStation.Album"),
            URLQueryItem(name: "library", value: "all"),
            URLQueryItem(name: "method", value: "list"),
            URLQueryItem(name: "version", value: "3"),
        ]
        switch self {
            case .list(let limit):
                if let limit = limit {
                    params.append(URLQueryItem(name: "limit", value: "\(limit)"))
                }
            case .artist(let artist):
                params.append(URLQueryItem(name: "artist", value: artist))
            case .composer(let composer):
                params.append(URLQueryItem(name: "composer", value: composer))
        }
        return params
    }
}

class AlbumRequest {
    private var requestable = NetworkRequestable()
    
    func albumListPublisher(limit: Int?) -> AnyPublisher<Response<Albums>, NetworkError> {
        let endpoint = AlbumEndpoint.list(limit: limit)
        let request = Request(endpoint: endpoint, timeout: 1000)
        return self.requestable.issue(request: request)
    }
    
    func albumSearchPublisher(artist: String) -> AnyPublisher<Response<Albums>, NetworkError> {
        let endpoint = AlbumEndpoint.artist(artist: artist)
        let request = Request(endpoint: endpoint, timeout: 1000)
        return self.requestable.issue(request: request)
    }
    
    func albumSearchPublisher(composer: String) -> AnyPublisher<Response<Albums>, NetworkError> {
        let endpoint = AlbumEndpoint.composer(composer: composer)
        let request = Request(endpoint: endpoint, timeout: 1000)
        return self.requestable.issue(request: request)
    }
}
