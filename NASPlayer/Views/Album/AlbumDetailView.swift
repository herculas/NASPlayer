//
//  AlbumDetailView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct AlbumDetailView: View {
    
    var album: AlbumVM
    @ObservedObject var albumCoverRequest: AlbumCoverRequest
    @ObservedObject var albumDetailRequest: AlbumDetailRequst
    
    init(album: AlbumVM) {
        self.album = album
        self.albumCoverRequest = AlbumCoverRequest(album: self.album)
        self.albumDetailRequest = AlbumDetailRequst(album: self.album.name)
    }
    
    var body: some View {
        List {
            albumCover(cover: self.albumCoverRequest.image)
            albumTitle(album: self.album, songs: self.albumDetailRequest.songs)
            buttonLine(songs: self.albumDetailRequest.songs)
            songList(songs: self.albumDetailRequest.songs)
            songStatistics(count: self.albumDetailRequest.count, duration: self.albumDetailRequest.duration)
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func albumCover(cover: UIImage?) -> some View {
        HStack {
            Spacer()
            if let cover = cover {
                VStack {
                    Image(uiImage: cover)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .frame(maxWidth: 280, maxHeight: 280)
                        .shadow(radius: 5)
                        .padding(.bottom, 5)
                }
                .frame(height: 280)
            } else {
                ProgressView()
                    .frame(width: 280, height: 280)
            }
            Spacer()
        }
        .listRowSeparator(.hidden)
    }
    
    @ViewBuilder
    private func albumTitle(album: AlbumVM, songs: [Int: [SongVM]]?) -> some View {
        HStack {
            Spacer()
            VStack {
                Text(album.name)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.bottom, -2)

                Text(album.albumArtist)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(.accentColor)
                    .padding(.bottom, -1)
                
                if let songs = songs {
                    HStack(spacing: 8) {
                        if let genre = songs.first?.value.first?.genre {
                            Text(parse(genres: genre))
                        }
                        Text(String(album.year))
                    }
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                }
            }
            Spacer()
        }
        .listRowSeparator(.hidden)
    }
    
    @ViewBuilder
    private func buttonLine(songs: [Int: [SongVM]]?) -> some View {
        if let songs = songs {
            HStack(alignment: .center, spacing: 20) {
                Spacer()
                playButton(name: "Play", icon: "play.fill", count: songs.count <= 1)
                playButton(name: "Shuffle", icon: "shuffle", count: songs.count <= 1)
                Spacer()
            }
            .listRowSeparator(.hidden)
        }
    }
    
    @ViewBuilder
    private func playButton(name: String, icon: String, count: Bool) -> some View {
        Button(action: {
            
        }) {
            Label(name, systemImage: icon)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .labelStyle(.titleAndIcon)
        }
        .frame(width: 180, height: 45)
        .background(Color.paleGray)
        .foregroundColor(.accentColor)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.bottom, count ? 20 : 0)
    }
    
    @ViewBuilder
    private func songList(songs: [Int: [SongVM]]?) -> some View {
        if let songs = songs {
            ForEach(Array(songs.keys).sorted(by: <), id: \.self) { key in
                Section {
                    songSection(songs: songs[key])
                } header: {
                    if songs.count > 1 {
                        Text("Disc \(key)")
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func songSection(songs: [SongVM]?) -> some View {
        if let songs = songs {
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
    
    @ViewBuilder
    private func songStatistics(count: Int?, duration: Int?) -> some View {
        Text(convert(song: count) + convert(duration: duration))
            .font(.system(size: 14))
            .foregroundColor(.gray)
            .padding(.bottom, 60)
            .listRowSeparator(.hidden)
    }
}

#Preview {
    AlbumDetailView(album: AlbumVM.mock)
}
