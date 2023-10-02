//
//  URLCache+.swift
//  NASPlayer
//
//  Created by 宋睿 on 1/10/2023.
//

import Foundation

extension URLCache {
    static var imageCache: URLCache = .init(
        memoryCapacity: 100 * 1024 * 1024,       // memory cache: 20MB
        diskCapacity: 800 * 1024 * 1024         // disk cache: 100MB
    )
}
