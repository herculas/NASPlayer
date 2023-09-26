//
//  MainTabView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            
            NavigationStack {
                BrowseView()
            }
            .tabItem {
                Image(systemName: "viewfinder.circle")
                Text("Browse")
            }
            
            NavigationStack {
                AlbumListView()
            }
            .tabItem {
                Image(systemName: "play.square.stack.fill")
                Text("Albums")
            }
            
            NavigationStack {
                PlaylistsView()
            }
            .tabItem {
                Image(systemName: "music.note.list")
                Text("Playlists")
            }
            
            NavigationStack {
                MeView()
            }
            .tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Me")
            }
            
        }
    }
}

#Preview("Default") {
    MainTabView()
}

#Preview("Simp CH") {
    MainTabView()
        .environment(\.locale, Locale(identifier: "zh_Hans_CN"))
}

#Preview("Trad CH") {
    MainTabView()
        .environment(\.locale, Locale(identifier: "zh_Hant"))
}

#Preview("Japanese") {
    MainTabView()
        .environment(\.locale, Locale(identifier: "JA"))
}
