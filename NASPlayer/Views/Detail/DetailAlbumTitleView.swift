//
//  DetailAlbumTitleView.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import SwiftUI

struct DetailAlbumTitleView: View {
    
    var album: AlbumVM
    var songs: [Int: [SongVM]]?
    
    var body: some View {
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
    }
}
