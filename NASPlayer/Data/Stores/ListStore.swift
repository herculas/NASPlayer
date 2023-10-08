//
//  ListStore.swift
//  NASPlayer
//
//  Created by 宋睿 on 8/10/2023.
//

import SwiftUI

final class ListStore: ObservableObject {
//    @AppStorage("list.list") var list: [String] = []
    @AppStorage("list.offset") var offset: Int = 0
}
