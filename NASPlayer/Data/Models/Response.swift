//
//  Response.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

// MARK: - Response Wrapper
struct Response<T: Codable>: Codable {
    let data: T?
    let success: Bool?
}
