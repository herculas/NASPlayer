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
                Label(
                    title: {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading, spacing: 2){
                                Text(song.title)
                                    .font(.system(size: 15))
                                    .frame(width: 300, alignment: .leading)
                                    .lineLimit(1)
                                Text(song.artist)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.secondary)
                                    .frame(width: 300, alignment: .leading)
                                    .lineLimit(1)
                            }
                            Spacer()
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.secondary)
                        }
                    }, icon: {
                        Image(systemName: "42.circle")
                    }
                )
                .listSectionSeparator(.visible, edges: .top)
                .labelStyle(MultiRowLabelStyle())
                .alignmentGuide(.listRowSeparatorLeading) { viewDimensions in
                    if song == songs.last {
                        return 0
                    } else {
                        return 38
                    }
                }
            }
        }
    }
}

#Preview {
//    PlaylistSongListView()
    PlaylistDetailView(playlist: PlaylistVM.mock)
}
