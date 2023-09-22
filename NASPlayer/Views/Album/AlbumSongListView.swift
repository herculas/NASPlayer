//
//  AlbumSongListView.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import SwiftUI

struct AlbumSongListView: View {
    
    var discs: [Int: [SongVM]]?
    
    var body: some View {
        if let discs = discs {
            ForEach(Array(discs.keys).sorted(by: <), id: \.self) { key in
                Section {
                    DiscSectionView(tracks: discs[key])
                } header: {
                    if discs.count > 1 {
                        Text("Disc \(key)")
                    }
                }
            }
        }
    }
}

struct DiscSectionView: View {
    
    var tracks: [SongVM]?
    
    var body: some View {
        if let songs = tracks {
            ForEach(songs, id: \.self) { song in
                Label(
                    title: {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading, spacing: 2) {
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
                        Text("\(song.track)")
                            .font(.system(size: 15))
                            .foregroundStyle(.secondary)
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
