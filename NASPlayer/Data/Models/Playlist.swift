//
//  Playlist.swift
//  NASPlayer
//
//  Created by 宋睿 on 20/9/2023.
//

import Foundation

// MARK: - Playlist List
struct Playlists: Codable {
    let playlists: [Playlist]?
    let offset: Int?
    let total: Int?
}

// MARK: - Playlist
struct Playlist: Codable, Identifiable {
    let id: String
    let name: String?
    let type: String?
    let library: String?
    let sharingStatus: String?
    let path: String?
    let additional: PlaylistAdditional?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case library
        case sharingStatus = "sharing_status"
        case path
        case additional
    }
}

// MARK: - Playlist Additional Parameters
struct PlaylistAdditional: Codable {
    let songs: [Song]?
    let sharingInfo: PlaylistSharingInfo?
    let songsOffset: Int?
    let songsTotal: Int?
    
    enum CodingKeys: String, CodingKey {
        case songs
        case sharingInfo = "sharing_info"
        case songsOffset = "songs_offset"
        case songsTotal = "songs_total"
    }
}

// MARK: - Playlist Sharing Information
struct PlaylistSharingInfo: Codable {
    let id: String
    let url: String?
    let status: String?
    let dateAvailable: String?
    let dateExpired: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case status
        case dateAvailable = "date_available"
        case dateExpired = "date_expired"
    }
}
