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
    
    var safeWidth: CGFloat {
        let logicalWidth: CGFloat = Device.current.logicalResolution?.width ?? 0.0
        return logicalWidth - 120
    }
    
    var body: some View {
        if let discs = self.discs {
            ForEach(Array(discs.keys).sorted(by: <), id: \.self) { key in
                Section {
                    AlbumDiscView(disc: discs[key])
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
    
    @ViewBuilder
    private func AlbumDiscView(disc: [SongVM]?) -> some View {
        if let tracks = disc {
            ForEach(tracks) {
                AlbumTrackView(track: $0, indent: $0 == tracks.last ? 0 : 38)
            }
        }
    }
    
    @ViewBuilder
    private func AlbumTrackView(track: SongVM, indent: CGFloat) -> some View {
        Label(
            title: {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(track.title)
                            .font(.callout)
                            .frame(width: self.safeWidth, alignment: .leading)
                            .lineLimit(1)
                        Text(track.artist)
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
                Text("\(track.track)")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        )
        .listSectionSeparator(.visible, edges: .top)
        .labelStyle(MultiRowLabelStyle())
        .alignmentGuide(.listRowSeparatorLeading, computeValue: { dimension in
            return indent
        })
    }
}

#Preview {
    AlbumDetailView(album: AlbumVM.mock)
}
