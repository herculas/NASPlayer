//
//  Genre.swift
//  NASPlayer
//
//  Created by 宋睿 on 1/10/2023.
//

import Foundation

// MARK: - Genre List
struct Genres: Codable {
    let genres: [Genre]?
    let offset: Int?
    let total: Int?
}

// MARK: - Genre
struct Genre: Codable, Identifiable {
    let id = UUID()
    let name: String
    let additional: GenreAdditional?
    
    enum CodingKeys: String, CodingKey {
        case name
        case additional
    }
}

// MARK: - Additional
struct GenreAdditional: Codable {
    let avgRating: AvgRating?

    enum CodingKeys: String, CodingKey {
        case avgRating = "avg_rating"
    }
}
