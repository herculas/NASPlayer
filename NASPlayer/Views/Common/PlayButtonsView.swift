//
//  DetailButtonRowView.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import SwiftUI

enum ListType {
    case album
    case playlist
}

struct PlayButtonsView: View {
    
    var songs: [SongVM]?
    var type: ListType
    
    var body: some View {
        if let songs = songs {
            HStack(alignment: .center, spacing: 25) {
                Button(action: {
                    
                }, label: {
                    Label("Play", systemImage: "play.fill")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .labelStyle(.titleAndIcon)
                })
                .frame(width: 180, height: 45)
                .foregroundStyle(.accent)
                .background(.quaternary)
                .clipShape(.rect(cornerRadius: 10))
                
                Button(action: {
                    
                }, label: {
                    Label("Shuffle", systemImage: "shuffle")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                        .labelStyle(.titleAndIcon)
                })
                .frame(width: 180, height: 45)
                .foregroundStyle(.accent)
                .background(.quaternary)
                .clipShape(.rect(cornerRadius: 10))
            }
            .listRowSeparator(.hidden)
            .padding(
                .bottom,
                (Dictionary(grouping: songs, by: { $0.disc }).count > 1 && self.type == .album) ? 0 : 24
            )
        }
    }
}

#Preview {
    AlbumDetailView(album: AlbumVM.mock)
}
