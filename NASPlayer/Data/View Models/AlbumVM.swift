//
//  AlbumVM.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import Foundation

struct AlbumVM: Identifiable {
    var id: UUID
    var name: String
    var year: Int
    var artist: String
    var albumArtist: String
}

func transform(from album: Album) -> AlbumVM {
    return AlbumVM(
        id: album.id,
        name: album.name,
        year: album.year ?? 0,
        artist: album.artist ?? "unknown",
        albumArtist: album.albumArtist ?? album.displayArtist ?? "unknown"
    )
}

extension AlbumVM {
    static let mock: AlbumVM = AlbumVM(
        id: UUID(),
        name: "ゼノブレイド3 オリジナル・サウンドトラック",
        year: 2013,
        artist: "",
        albumArtist: "株式会社モノリスソフト"
    )
}
