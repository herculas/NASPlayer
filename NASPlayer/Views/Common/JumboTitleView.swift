//
//  JumboTitleView.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import SwiftUI

struct JumboTitleView: View {
    var title: String
    var artist: String?
    var year: Int?
    var songs: [Int: [SongVM]]?
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text(title)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.bottom, -2)
                
                if let artist = self.artist {
                    Text(artist)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(.accentColor)
                        .padding(.bottom, -1)
                }
                
                if let songs = self.songs {
                    HStack(spacing: 8) {
                        if let genre = songs.first?.value.first?.genre {
                            Text(parse(genres: genre))
                        }
                        if let year = self.year {
                            Text(String(year))
                        }
                    }
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                }
            }
            Spacer()
        }
    }
}
