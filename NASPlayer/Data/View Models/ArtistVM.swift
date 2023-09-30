//
//  ArtistVM.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import Foundation

struct ArtistVM: Identifiable {
    var id: UUID
    var name: String
    var rating: Float
}

func transform(from artist: Artist) -> ArtistVM {
    return ArtistVM(
        id: artist.id,
        name: artist.name,
        rating: artist.additional?.avgRating?.rating ?? 0.0
    )
}

extension ArtistVM {
    static let mock: ArtistVM = ArtistVM(
        id: UUID(),
        name: "川井憲次",
        rating: 3.4
    )
}
