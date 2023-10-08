//
//  ArtistRequest.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import Foundation
import Combine

enum ArtistEndpoint: Endpoint {
    case list(limit: Int?)
    
    var host: String { UserStore.shared.host }
    var port: Int { UserStore.shared.port }
    var path: String { "/webapi/AudioStation/artist.cgi" }
    var method: HTTPMethod { .get }
    var headers: [String : String] { [:] }
    var params: [URLQueryItem] {
        var params = [
            URLQueryItem(name: "_sid", value: UserStore.shared.sid),
            URLQueryItem(name: "api", value: "SYNO.AudioStation.Artist"),
            URLQueryItem(name: "method", value: "list"),
            URLQueryItem(name: "library", value: "all"),
            URLQueryItem(name: "version", value: "4"),
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

class ArtistRequest {
    private var requestable = NetworkRequestable()
    
    func artistListPublisher(limit: Int?) -> AnyPublisher<Response<Artists>, NetworkError> {
        let endpoint = ArtistEndpoint.list(limit: limit)
        let request = Request(endpoint: endpoint, timeout: 1000)
        return self.requestable.issue(request: request)
    }
}
