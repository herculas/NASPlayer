//
//  Files.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import Foundation

public func loadFile(from path: String) -> Data? {
    guard let file = Bundle.main.path(forResource: path, ofType: "json") else {
        fatalError("[File] Unable to locate file \(path) in main bundle.")
    }
    do {
        return try String(contentsOfFile: file).data(using: .utf8)
    } catch {
        fatalError("[File] Unable to resolve file \(path) in main bundle:\n\(error)")
    }
}
