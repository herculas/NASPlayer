//
//  PlaylistVM.swift
//  NASPlayer
//
//  Created by 宋睿 on 20/9/2023.
//

import Foundation

struct PlaylistVM: Identifiable {
    var id: String
    var name: String
}

extension PlaylistVM: Equatable {
    static func == (lhs: PlaylistVM, rhs: PlaylistVM) -> Bool {
        return lhs.id == rhs.id
    }
}

func transform(from playlist: Playlist) -> PlaylistVM {
    return PlaylistVM(
        id: playlist.id,
        name: playlist.name ?? "unknown"
    )
}

extension PlaylistVM {
    static let mock: PlaylistVM = PlaylistVM(
        id: "playlist_personal_normal/3",
        name: "Xenoblade"
    )
}
