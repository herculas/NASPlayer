//
//  Composer.swift
//  NASPlayer
//
//  Created by 宋睿 on 1/10/2023.
//

import Foundation

// MARK: - Composer List
struct Composers: Codable {
    let composers: [Composer]?
    let offset: Int?
    let total: Int?
}

// MARK: - Composer
struct Composer: Codable, Identifiable {
    let id = UUID()
    let name: String
    let additional: ComposerAdditional?
    
    enum CodingKeys: String, CodingKey {
        case name
        case additional
    }
}

// MARK: - Composer Additional
struct ComposerAdditional: Codable {
    let avgRating: AvgRating?

    enum CodingKeys: String, CodingKey {
        case avgRating = "avg_rating"
    }
}
