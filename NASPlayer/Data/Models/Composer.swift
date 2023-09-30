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

// MARK: - Additional
struct ComposerAdditional: Codable {
    let avgRating: ComposerAvgRating?

    enum CodingKeys: String, CodingKey {
        case avgRating = "avg_rating"
    }
}

// MARK: - Composer Average Rating
struct ComposerAvgRating: Codable {
    let rating: Float?
}
