//
//  ContentView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var store = UserStore.shared
    
    private func setStore() {
        self.store.account = "Jon"
        self.store.host = "server.herculas.net"
        self.store.port = 12803
        self.store.sid = "OktgjS2jAob5NxjBwBgTzcnW0YI98xSmj-_4_zhJG9YtKkEuXgEklAnI1PSrmcSrDIJFQN6R_0poeW7h3xphOI"
    }
    
    var body: some View {
        MainTabView()
            .onAppear {
                self.setStore()
            }
    }
}

#Preview {
    ContentView()
}
