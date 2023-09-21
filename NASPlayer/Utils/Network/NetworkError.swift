//
//  NetworkError.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

enum NetworkError: Error, Equatable {
    case badUrl(_ error: String)
    case noResponse(_ error: String)
    case invalidJson(_ error: String)
    case cannotParseData(_ error: String)
    
    case apiError(code: Int, error: String)
    case unauthorized(code: Int, error: String)
    case badRequest(code: Int, error: String)
    case serverError(code: Int, error: String)
    case unknown(code: Int, error: String)
}
