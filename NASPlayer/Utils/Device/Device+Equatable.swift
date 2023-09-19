//
//  Device+Equatable.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

extension Device: Equatable {
    public static func == (lhs: Device, rhs: Device) -> Bool {
        return lhs.description == rhs.description
    }
}
