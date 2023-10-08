//
//  Logger+.swift
//  NASPlayer
//
//  Created by 宋睿 on 5/10/2023.
//

import OSLog

extension Logger {
    private static let subsystem: String = Bundle.main.bundleIdentifier!
    static let network = Logger(subsystem: Logger.subsystem, category: LogCategory.network.rawValue)
}

enum LogCategory: String {
    case network
}
