//
//  SongCount.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

public func convert(song number: Int?) -> String {
    let number = number ?? 0
    var desc = String(number)
    if number < 2 {
        desc += " track, "
    } else {
        desc += " tracks, "
    }
    return desc
}
