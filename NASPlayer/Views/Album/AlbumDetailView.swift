//
//  AlbumDetailView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct AlbumDetailView: View {
    
    var album: AlbumVM
    @ObservedObject var albumCoverService: AlbumCoverService
    @ObservedObject var albumSongsService: AlbumSongsService
    
    init(album: AlbumVM) {
        self.album = album
        self.albumCoverService = AlbumCoverService(album: album)
        self.albumSongsService = AlbumSongsService(album: album.name)
    }
    
    var body: some View {
        List {
            BannerCoverView(cover: self.albumCoverService.image)
                .listRowSeparator(.hidden)
            JumboTitleView(
                title: self.album.name,
                artist: self.album.albumArtist,
                year: self.album.year,
                songs: self.albumSongsService.songs
            )
            .listRowSeparator(.hidden)
            PlayButtonsView(
                songs: self.albumSongsService.songs,
                type: .album
            )
            AlbumSongListView(songs: self.albumSongsService.songs)
            StatisticsView(
                count: self.albumSongsService.count,
                duration: self.albumSongsService.duration
            )
            .listRowSeparator(.hidden, edges: .bottom)
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AlbumDetailView(album: AlbumVM.mock)
}
