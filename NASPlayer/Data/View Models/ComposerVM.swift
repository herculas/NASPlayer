//
//  ComposerVM.swift
//  NASPlayer
//
//  Created by 宋睿 on 1/10/2023.
//

import Foundation

struct ComposerVM: Identifiable {
    var id: UUID
    var name: String
    var rating: Float
}

func transform(from composer: Composer) -> ComposerVM {
    return ComposerVM(
        id: composer.id,
        name: composer.name,
        rating: composer.additional?.avgRating?.rating ?? 0.0
    )
}

extension ComposerVM {
    static let mock: ComposerVM = ComposerVM(
        id: UUID(),
        name: "陈致逸",
        rating: 4.6
    )
}
