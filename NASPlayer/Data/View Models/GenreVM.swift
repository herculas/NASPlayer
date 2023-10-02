//
//  GenreVM.swift
//  NASPlayer
//
//  Created by 宋睿 on 1/10/2023.
//

import Foundation

struct GenreVM: Identifiable {
    var id: UUID
    var name: String
    var rating: Float
}

func transform(from genre: Genre) -> GenreVM {
    return GenreVM(
        id: genre.id,
        name: genre.name,
        rating: genre.additional?.avgRating?.rating ?? 0.0
    )
}

extension GenreVM {
    static let mock: GenreVM = GenreVM(
        id: UUID(),
        name: "Soundtrack",
        rating: 4.3
    )
}
