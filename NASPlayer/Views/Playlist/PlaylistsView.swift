//
//  PlaylistsView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct PlaylistsView: View {
    
    @ObservedObject var playlistsService = PlaylistsService()
    
    var body: some View {
        List {
            if let playlists = self.playlistsService.playlists {
                ForEach(playlists) { playlist in
                    NavigationLink {
                        PlaylistDetailView(playlist: playlist)
                    } label: {
                        PlaylistEntryView(playlist: playlist)
                            .alignmentGuide(.listRowSeparatorLeading, computeValue: { dimension in
                                if playlist == playlists.last {
                                    return 0
                                } else {
                                    return 90
                                }
                            })
                    }
                }
            }
        }
        .listStyle(.inset)
        .navigationTitle("Playlists")
    }
}

#Preview {
    PlaylistsView()
}
