//
//  ContentView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var store = UserStore.shared
    
//    private func setStore() {
//        self.store.account = "Jon"
//        self.store.host = "server.herculas.net"
//        self.store.port = 12803
//        self.store.sid = "n8it2WrZ5RDJ_DudfMTLYnaxzI3jgdeircqeKKXMJ5Eo8N1r3bRnr4TDycZl3A5Lczmj9newol8iFM3DxKeigU"
//    }
    
    var body: some View {
        MainTabView()
//            .onAppear { self.setStore() }
    }
}

#Preview {
    ContentView()
}
