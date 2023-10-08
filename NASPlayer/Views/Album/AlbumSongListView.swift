//
//  AlbumSongListView.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import SwiftUI

struct AlbumSongListView: View {
    
    var songs: [SongVM]?
    var discs: [Int : [SongVM]]?
    
    init(songs: [SongVM]? = nil, discs: [Int : [SongVM]]? = nil) {
        if let songs = songs {
            self.songs = songs
            self.discs = Dictionary(grouping: songs, by: { $0.disc })
        }
    }
    
    var body: some View {
        if let discs = self.discs {
            ForEach(Array(discs.keys).sorted(by: <), id: \.self) { key in
                Section {
                    AlbumDiscView(tracks: discs[key])
                } header: {
                    if discs.count > 1 {
                        Text("Disc \(key)")
                    }
                }
            }
        } else {
            EmptyView()
        }
    }
}

struct AlbumDiscView: View {
    
    var tracks: [SongVM]?
    
    var safeWidth: CGFloat {
        let logicalWidth: CGFloat = Device.current.logicalResolution?.width ?? 0.0
        return logicalWidth - 120
    }
    
    var body: some View {
        if let songs = self.tracks {
            ForEach(songs, id: \.self) { song in
                Label(
                    title: {
                        HStack(alignment: .center) {
                            VStack(alignment: .leading, spacing: 2) {
                                Text(song.title)
                                    .font(.callout)
                                    .frame(width: self.safeWidth, alignment: .leading)
                                    .lineLimit(1)
                                Text(song.artist)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                    .frame(width: self.safeWidth, alignment: .leading)
                                    .lineLimit(1)
                            }
                            Spacer()
                            Image(systemName: "ellipsis")
                                .foregroundStyle(.secondary)
                                .padding(.trailing, 5)
                        }
                    }, icon: {
                        Text("\(song.track)")
                            .font(.callout)
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

#Preview {
    AlbumDetailView(album: AlbumVM.mock)
}
