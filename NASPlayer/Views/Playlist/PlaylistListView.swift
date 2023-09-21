//
//  PlaylistListViewd.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct PlaylistListView: View {
    
    @ObservedObject var playlistsService = PlaylistsService()
    
    var body: some View {
        List {
            if let playlists = self.playlistsService.playlists {
                ForEach(playlists) { playlist in
                    Text(playlist.name)
                }
            }
        }
        .listStyle(.inset)
        .navigationTitle("Playlists")
    }
}

#Preview {
    PlaylistListView()
}
