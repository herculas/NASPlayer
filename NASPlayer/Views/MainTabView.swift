//
//  MainTabView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var playerExpanded = false
    @Namespace private var animation
    
    var body: some View {
        TabView {
            
            // MARK: - Browse
            NavigationStack {
                BrowseView()
            }
            .tabItem {
                Image(systemName: "viewfinder.circle")
                Text("Browse")
            }
            
            // MARK: - Albums
            NavigationStack {
                AlbumListView()
            }
            .tabItem {
                Image(systemName: "play.square.stack.fill")
                Text("Albums")
            }
            
            // MARK: - Playlists
            NavigationStack {
                PlaylistsView()
            }
            .tabItem {
                Image(systemName: "music.note.list")
                Text("Playlists")
            }
            
            // MARK: Settings
            NavigationStack {
                SettingView()
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Setting")
            }
        }
    }
}

#Preview("English") {
    MainTabView()
        .environment(\.locale, Locale(identifier: "en"))
}

#Preview("Simplified Chinese") {
    MainTabView()
        .environment(\.locale, Locale(identifier: "zh_Hans"))
}

#Preview("Traditional Chinese") {
    MainTabView()
        .environment(\.locale, Locale(identifier: "zh_Hant"))
}

#Preview("Japanese") {
    MainTabView()
        .environment(\.locale, Locale(identifier: "ja"))
}
