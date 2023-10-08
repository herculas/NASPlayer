//
//  UserStore.swift
//  NASPlayer
//
//  Created by 宋睿 on 7/10/2023.
//

import SwiftUI

final class UserStore: ObservableObject {
    static let shared = UserStore()
    
    @AppStorage("user.host") var host: String = ""
    @AppStorage("user.port") var port: Int = 0
    @AppStorage("user.sid") var sid: String = ""
    @AppStorage("user.account") var account: String = ""
}
