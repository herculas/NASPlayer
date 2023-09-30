//
//  Album.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import Foundation

// MARK: - Album List
struct Albums: Codable {
    let albums: [Album]?
    let offset: Int?
    let total: Int?
}

// MARK: - Album
struct Album: Codable, Identifiable {
    let id = UUID()
    let name: String
    let year: Int?
    let artist: String?
    let albumArtist: String?
    let displayArtist: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case year
        case artist
        case albumArtist = "album_artist"
        case displayArtist = "display_artist"
    }
}
