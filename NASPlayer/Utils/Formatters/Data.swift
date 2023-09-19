//
//  Data.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import Foundation

public func resolve<T: Decodable>(json data: Data) -> T {
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("[File] Unable to decode the file \(data) as \(T.self):\n\(error)")
    }
}
