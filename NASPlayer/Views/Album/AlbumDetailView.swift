//
//  AlbumDetailView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct AlbumDetailView: View {
    
    var album: AlbumVM
    @ObservedObject var albumCoverService: AlbumCoverRequest
    @ObservedObject var albumDetailService: AlbumSongsService
    
    init(album: AlbumVM) {
        self.album = album
        self.albumCoverService = AlbumCoverRequest(album: self.album)
        self.albumDetailService = AlbumSongsService(album: self.album.name)
    }
    
    var body: some View {
        List {
            DetailCoverView(cover: self.albumCoverService.image)
                .listRowSeparator(.hidden)
            DetailAlbumTitleView(album: self.album, songs: self.albumDetailService.songs)
                .listRowSeparator(.hidden)
            DetailButtonRowView(songs: self.albumDetailService.songs)
            DetailAlbumSongsView(discs: self.albumDetailService.songs)
            DetailStatisticsView(count: self.albumDetailService.count, duration: self.albumDetailService.duration)
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AlbumDetailView(album: AlbumVM.mock)
}
