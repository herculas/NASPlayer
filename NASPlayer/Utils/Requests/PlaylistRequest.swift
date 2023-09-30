//
//  PlaylistRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import Foundation
import Combine

enum PlaylistEndpoint: Endpoint {
    case list
    case detail(id: String)
    
    var baseUrl: String { "server.herculas.net"}
    var port: Int { 12803 }
    var path: String { "/webapi/AudioStation/playlist.cgi" }
    var method: HTTPMethod { .get }
    var headers: [String : String] { [:] }
    var params: [URLQueryItem] {
        var params = [
            URLQueryItem(name: "_sid", value: "n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU"),
            URLQueryItem(name: "api", value: "SYNO.AudioStation.Playlist"),
            URLQueryItem(name: "library", value: "all"),
            URLQueryItem(name: "version", value: "3"),
        ]
        switch self {
        case .list:
            params.append(URLQueryItem(name: "method", value: "list"))
            params.append(URLQueryItem(name: "offset", value: "0"))
            params.append(URLQueryItem(name: "limit", value: "5000"))
        case .detail(let id):
            params.append(URLQueryItem(name: "method", value: "getinfo"))
            params.append(URLQueryItem(name: "id", value: id))
            params.append(URLQueryItem(name: "additional", value: "sharing_info,songs,songs_song_tag,songs_song_audio,songs_song_rating"))
            params.append(URLQueryItem(name: "songs_limit", value: "5000"))
            params.append(URLQueryItem(name: "songs_offset", value: "0"))
        }
        return params
    }
}

class PlaylistRequest {
    private var requestable = NetworkRequestable()
    
    func listPublisher() -> AnyPublisher<Response<Playlists>, NetworkError> {
        let endpoint = PlaylistEndpoint.list
        let request = Request(endpoint: endpoint, timeout: 1000)
        return self.requestable.issue(request: request)
    }
    
    func detailPublisher(id: String) -> AnyPublisher<Response<Playlists>, NetworkError> {
        let endpoint = PlaylistEndpoint.detail(id: id)
        let request = Request(endpoint: endpoint, timeout: 1000)
        return self.requestable.issue(request: request)
    }
}
