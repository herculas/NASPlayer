//
//  SettingStore.swift
//  NASPlayer
//
//  Created by 宋睿 on 7/10/2023.
//

import SwiftUI

final class SettingStore: ObservableObject {
    @AppStorage("setting.color-scheme") var colorScheme: Bool = true
    @AppStorage("setting.cache-size") var cacheSize: Int = 1000
}
