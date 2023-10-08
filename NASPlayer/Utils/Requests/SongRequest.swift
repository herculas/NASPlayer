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
    
    var host: String { UserStore.shared.host }
    var port: Int { UserStore.shared.port }
    var path: String { "/webapi/AudioStation/song.cgi" }
    var method: HTTPMethod { .get }
    var headers: [String : String] { [:] }
    var params: [URLQueryItem] {
        var params = [
            URLQueryItem(name: "_sid", value: UserStore.shared.sid),
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
}

class SongRequest {
    private var requestable = NetworkRequestable()
    
    func songsPublisher(album: String) -> AnyPublisher<Response<Songs>, NetworkError> {
        let endpoint = SongEndpoint.list(album: album)
        let request = Request(endpoint: endpoint, timeout: 1000)
        return self.requestable.issue(request: request)
    }
}
