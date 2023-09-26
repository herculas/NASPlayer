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
        .safeAreaInset(edge: .bottom) {
            ReducedPlayerView(
                playerExpanded: self.$playerExpanded,
                animation: self.animation
            )
        }
        .overlay {
            if self.playerExpanded {
                ExpandedPlayerView(
                    playerExpanded: self.$playerExpanded,
                    animation: self.animation
                )
                // transition with more fluent animation
                .transition(.asymmetric(insertion: .identity, removal: .offset(y: -5)))
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
