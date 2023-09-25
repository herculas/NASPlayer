//
//  Time.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import Foundation

public func describe(time second: Int) -> String {
    let h = second / 3600
    let m = (second / 60) % 60
    let s = second % 60
    
    if h > 0 {
        return String(format: "%d:%02d:%02d", h, m, s)
    } else {
        return String(format: "%d:%02d", m, s)
    }
}

public func getCurrentDay() -> Int {
    return Calendar.current.component(.day, from: Date())
}

public func getCurrentMonth() -> Int {
    return Calendar.current.component(.month, from: Date())
}

public func getCurrentYear() -> Int {
    return Calendar.current.component(.year, from: Date())
}
