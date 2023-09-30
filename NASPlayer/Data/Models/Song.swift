//
//  Song.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

// MARK: - Song List
struct Songs: Codable {
    let songs: [Song]?
    let offset: Int?
    let total: Int?
}

// MARK: - Song
struct Song: Codable, Identifiable {
    let id: String
    let path: String?
    let title: String?
    let type: String?
    let additional: SongAdditional?
}

// MARK: - Song Additional
struct SongAdditional: Codable {
    let songAudio: SongAudio?
    let songRating: SongRating?
    let songTag: SongTag?
    
    enum CodingKeys: String, CodingKey {
        case songAudio = "song_audio"
        case songRating = "song_rating"
        case songTag = "song_tag"
    }
}

// MARK: - Song Audio Parameters
struct SongAudio: Codable {
    let bitrate: Int?
    let channel: Int?
    let duration: Int?
    let filesize: Int?
    let frequency: Int?
    let codec: String?
    let container: String?
}

// MARK: - Song Rating
struct SongRating: Codable {
    let rating: Int?
}

// MARK: - Song Metadata Tags
struct SongTag: Codable {
    let album: String?
    let albumArtist: String?
    let artist: String?
    let comment: String?
    let composer: String?
    let genre: String?
    let disc: Int?
    let track: Int?
    let year: Int?
    
    enum CodingKeys: String, CodingKey {
        case album
        case albumArtist = "album_artist"
        case artist
        case comment
        case composer
        case genre
        case disc
        case track
        case year
    }
}

extension Song: Equatable, Hashable {
    static func == (lhs: Song, rhs: Song) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
