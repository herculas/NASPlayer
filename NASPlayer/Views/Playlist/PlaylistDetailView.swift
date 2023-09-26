//
//  PlaylistDetailView.swift
//  NASPlayer
//
//  Created by 宋睿 on 20/9/2023.
//

import SwiftUI

// TODO: 
struct PlaylistDetailView: View {
    
    var playlist: PlaylistVM
    @ObservedObject var playlistCoverService: PlaylistCoverService
    @ObservedObject var playlistSongsService: PlaylistSongsService
    
    init(playlist: PlaylistVM) {
        self.playlist = playlist
        self.playlistCoverService = PlaylistCoverService(id: playlist.id)
        self.playlistSongsService = PlaylistSongsService(id: playlist.id)
    }
    
    var body: some View {
        List {
            BannerCoverView(cover: self.playlistCoverService.image)
//                .listRowSeparator(.hidden)
            JumboTitleView(title: self.playlist.name)
                .listRowSeparator(.hidden)
            PlayButtonsView(
                songs: self.playlistSongsService.songs,
                type: .playlist
            )
            PlaylistSongListView(songs: self.playlistSongsService.songs)
            StatisticsView(
                count: self.playlistSongsService.count,
                duration: self.playlistSongsService.duration
            )
            .listRowSeparator(.hidden, edges: .bottom)
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

#Preview {
    PlaylistDetailView(playlist: PlaylistVM.mock)
}
