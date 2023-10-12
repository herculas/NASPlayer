//
//  Date+RawRepresentable.swift
//  NASPlayer
//
//  Created by 宋睿 on 12/10/2023.
//

import Foundation

extension Date: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let date = try? JSONDecoder().decode(Date.self, from: data) else {
            return nil
        }
        self = date
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let res = String(data: data, encoding: .utf8) else {
            return ""
        }
        return res
    }
}
