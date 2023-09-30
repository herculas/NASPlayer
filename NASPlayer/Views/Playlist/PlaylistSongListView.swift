//
//  PlaylistSongListView.swift
//  NASPlayer
//
//  Created by 宋睿 on 25/9/2023.
//

import SwiftUI

struct PlaylistSongListView: View {
    var songs: [SongVM]?
    
    var body: some View {
        if let songs = self.songs {
            ForEach(songs) { song in
                PlaylistSongView(song: song)
                    .labelStyle(MultiRowLabelStyle(width: 40))
                    .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                        if song == songs.last {
                            return 0
                        } else {
                            return 48
                        }
                    }
            }
        }
    }
}

struct PlaylistSongView: View {
    var song: SongVM
    @ObservedObject var songCoverService: SongCoverService
    
    init(song: SongVM) {
        self.song = song
        self.songCoverService = SongCoverService(id: song.id)
    }
    
    var safeWidth: CGFloat {
        let logicalWidth: CGFloat = CGFloat(Device.current.logicalResolution?.width ?? 0.0)
        return logicalWidth - 120
    }
    
    var body: some View {
        Label(
            title: {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 2){
                        Text(self.song.title)
                            .font(.callout)
                            .frame(width: self.safeWidth, alignment: .leading)
                            .lineLimit(1)
                        Text(self.song.artist)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .frame(width: self.safeWidth, alignment: .leading)
                            .lineLimit(1)
                    }
                    Spacer()
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.secondary)
                }
            }, icon: {
                if let cover = self.songCoverService.image {
                    Image(uiImage: cover)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 36, height: 36)
                        .clipShape(.rect(cornerRadius: 3))
                        .shadow(radius: 1)
                } else {
                    ProgressView()
                        .frame(width: 36, height: 36)
                }
            }
        )
    }
}

#Preview {
    PlaylistDetailView(playlist: PlaylistVM.mock)
}
