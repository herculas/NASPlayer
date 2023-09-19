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
            
                // TODO: play button and shuffle button
            
            songList(songs: self.albumDetailRequest.songs)
            songStatistics(count: self.albumDetailRequest.count, duration: self.albumDetailRequest.duration)
        }
        .listStyle(.inset)
        .navigationBarTitleDisplayMode(.inline)
        
            // TODO: navigation bar title
            // .navigationBarTitleDisplayMode(.automatic)
            // .navigationTitle(self.album.name)
    }
    
    @ViewBuilder
    private func albumCover(cover: UIImage?) -> some View {
        HStack {
            Spacer()
            if let cover = cover {
                Image(uiImage: cover)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
                    .frame(maxWidth: 280, maxHeight: 280)
                    .shadow(radius: 5)
                    .padding(.bottom, 5)
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
    
        // TODO: long seperator lines (vertical, top and bottom)
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
                HStack {
                        // track No.
                    Text("\(song.track)")
                        .frame(width: 30, alignment: .center)
                        .foregroundColor(.gray)
                        .padding(.leading, -10)
                    
                        // song title and artist name
                    VStack(alignment: .leading, spacing: 2) {
                        Text(song.title)
                            .font(.system(size: 15))
                            .frame(width: 300, alignment: .leading)
                            .lineLimit(1)
                        Text(song.artist)
                            .font(.system(size: 12))
                            .foregroundColor(.lightGray)
                            .frame(width: 300, alignment: .leading)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                        // button for modification
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                }
            }
        }
    }
    
    @ViewBuilder
    private func songStatistics(count: Int?, duration: Int?) -> some View {
        Text(convert(song: count) + convert(duration: duration))
            .listRowSeparator(.hidden)
            .font(.system(size: 14))
            .foregroundColor(.gray)
        
        Spacer()
            .frame(height: 40)
            .listRowSeparator(.hidden)
    }
}

#Preview {
    AlbumDetailView(album: AlbumVM.mock)
}
