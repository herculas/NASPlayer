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
                PlaylistListView()
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

#Preview {
    MainTabView()
}
