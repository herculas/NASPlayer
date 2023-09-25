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
            HStack(alignment: .center, spacing: 20) {
                Spacer()
                PlayButtonView(name: "Play", icon: "play.fill", songs: songs)
                PlayButtonView(name: "Shuffle", icon: "shuffle", songs: songs)
                Spacer()
            }
            .listRowSeparator(.hidden)
            .padding(.bottom, (Dictionary(grouping: songs, by: { $0.disc }).count > 1 &&  self.type == .album) ? 0 : 24)
        }
    }
}

struct PlayButtonView: View {
    var name: String
    var icon: String
    var songs: [SongVM]
    
    var body: some View {
        Button(action: {
            
        }) {
            Label(name, systemImage: icon)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .labelStyle(.titleAndIcon)
        }
        .frame(width: 180, height: 45)
        .background(Color.paleGray)
        .foregroundStyle(Color.accentColor)
        .clipShape(.rect(cornerRadius: 10))
    }
}
