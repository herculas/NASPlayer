//
//  Artist.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import Foundation

// MARK: - Artist List
struct Artists: Codable {
    let artists: [Artist]?
    let offset: Int?
    let total: Int?
}

// MARK: - Artist
struct Artist: Codable, Identifiable {
    let id = UUID()
    let name: String
    let additional: ArtistAdditional?
    
    enum CodingKeys: String, CodingKey {
        case name
        case additional
    }
}

// MARK: - Additional
struct ArtistAdditional: Codable {
    let avgRating: ArtistAvgRating?

    enum CodingKeys: String, CodingKey {
        case avgRating = "avg_rating"
    }
}

// MARK: - Artist Average Rating
struct ArtistAvgRating: Codable {
    let rating: Float?
}
