//
//  Response.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

struct Response<T: Codable>: Codable {
    let data: T?
    let success: Bool?
}
