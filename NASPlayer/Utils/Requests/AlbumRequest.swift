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
    case genre(genre: String)
 
    var host: String { UserStore.shared.host }
    var port: Int { UserStore.shared.port }
    var path: String { "/webapi/AudioStation/album.cgi" }
    var method: HTTPMethod { .get }
    var headers: [String : String] { [:] }
    var params: [URLQueryItem] {
        var params = [
            URLQueryItem(name: "_sid", value: UserStore.shared.sid),
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
            case .genre(let genre):
                params.append(URLQueryItem(name: "genre", value: genre))
                params.append(URLQueryItem(name: "sort_by", value: "year"))
                params.append(URLQueryItem(name: "sort_direction", value: "desc"))
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
    
    func albumSearchPublisher(genre: String) -> AnyPublisher<Response<Albums>, NetworkError> {
        let endpoint = AlbumEndpoint.genre(genre: genre)
        let request = Request(endpoint: endpoint, timeout: 1000)
        return self.requestable.issue(request: request)
    }
}
