//
//  Response.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

// MARK: - Response Wrapper
struct Response<T: Codable>: Codable {
    let success: Bool?
    let data: T?
    let error: Error?
    
    struct Error: Codable {
        let code: Int?
    }
}
