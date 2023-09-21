//
//  SongRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import Foundation
import Combine

enum SongEndpoint: Endpoint {
    case list(album: String)
    
    var baseUrl: String {
        return "server.herculas.net"
    }
    var port: Int {
        return 12803
    }
    var path: String {
        return "/webapi/AudioStation/song.cgi"
    }
    var method: HTTPMethod {
        return .get
    }
    var params: [URLQueryItem] {
        var params = [
            URLQueryItem(name: "_sid", value: "n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU"),
            URLQueryItem(name: "api", value: "SYNO.AudioStation.Song"),
            URLQueryItem(name: "library", value: "all"),
            URLQueryItem(name: "method", value: "list"),
            URLQueryItem(name: "version", value: "3"),
            URLQueryItem(name: "additional", value: "song_tag,song_audio,song_rating,sharing_info,song_share,song_sharing,getsharing"),
            URLQueryItem(name: "offset", value: "0"),
            URLQueryItem(name: "limit", value: "5000"),
        ]
        switch self {
        case .list(let album):
            params.append(URLQueryItem(name: "album", value: album))
        }
        return params
    }
    var headers: [String : String] { return [:] }
}

class SongRequest {
    private var requestable = NetworkRequestable()
    
    func songsPublisher(album: String) -> AnyPublisher<Response<Songs>, NetworkError> {
        let endpoint = SongEndpoint.list(album: album)
        let request = Request(endpoint: endpoint, timeout: 1000)
        return self.requestable.issue(request: request)
    }
}
