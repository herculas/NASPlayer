//
//  SongVM.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

struct SongVM: Identifiable {
    var id: String
    
    var title: String
    var album: String
    var artist: String
    var composer: String
    var genre: String
    var disc: Int
    var track: Int
    var year: Int
    
    var bitrate: Int
    var channel: Int
    var duration: Int
    var frequency: Int
    var codec: String
    var container: String
    var size: Int
    
    var rating: Int
}

extension SongVM: Equatable, Hashable {
    static func == (lhs: SongVM, rhs: SongVM) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

func transform(from song: Song) -> SongVM {
    return SongVM(
        id: song.id,
        title: song.title ?? "unknown",
        album: song.additional?.songTag?.album ?? "unknown",
        artist: song.additional?.songTag?.artist ?? "unknown",
        composer: song.additional?.songTag?.composer ?? "unknown",
        genre: song.additional?.songTag?.genre ?? "unknown",
        disc: song.additional?.songTag?.disc ?? 0,
        track: song.additional?.songTag?.track ?? 0,
        year: song.additional?.songTag?.year ?? 0,
        bitrate: song.additional?.songAudio?.bitrate ?? 0,
        channel: song.additional?.songAudio?.channel ?? 0,
        duration: song.additional?.songAudio?.duration ?? 0,
        frequency: song.additional?.songAudio?.frequency ?? 0,
        codec: song.additional?.songAudio?.codec ?? "unknown",
        container: song.additional?.songAudio?.container ?? "unknown",
        size: song.additional?.songAudio?.filesize ?? 0,
        rating: song.additional?.songRating?.rating ?? 0
    )
}
