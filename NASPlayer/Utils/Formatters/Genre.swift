//
//  Genre.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import Foundation

public func parse(genres: String) -> String {
    var genreList = genres.components(separatedBy: ";")
    genreList = genreList.map { $0.trimmingCharacters(in: .whitespaces) }
    return genreList.joined(separator: " · ")
}
