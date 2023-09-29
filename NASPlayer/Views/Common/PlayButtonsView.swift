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
    
    @Environment(\.colorScheme) var colorScheme
    
    private var buttonBackground: Color {
        if self.colorScheme == .dark {
            return .lightGray
        } else {
            return .paleGray
        }
    }
    
    private var bottomPadding: CGFloat {
        if let songs = self.songs {
            return (Dictionary(grouping: songs, by: { $0.disc }).count > 1) && (self.type == .album) ? 0 : 24
        } else {
            return 0
        }
    }
    
    private var buttonWidth: CGFloat {
        return 180
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 25) {
            PlayButtonView()
            ShuffleButtonView()
        }
        .listRowSeparator(.hidden)
        .padding(.bottom, self.bottomPadding)
    }
    
    @ViewBuilder
    func PlayButtonView() -> some View {
        Button{
            
        } label: {
            Label("Play", systemImage: "play.fill")
                .font(.callout)
                .fontWeight(.semibold)
                .labelStyle(.titleAndIcon)
        }
        .foregroundStyle(.accent)
        .frame(width: self.buttonWidth, height: 45)
        .background(self.buttonBackground)
        .clipShape(.rect(cornerRadius: 10))
    }
    
    @ViewBuilder
    func ShuffleButtonView() -> some View {
        Button(action: {
            
        }, label: {
            Label("Shuffle", systemImage: "shuffle")
                .font(.callout)
                .fontWeight(.semibold)
                .labelStyle(.titleAndIcon)
        })
        .foregroundStyle(.accent)
        .frame(width: self.buttonWidth, height: 45)
        .background(self.buttonBackground)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    AlbumDetailView(album: AlbumVM.mock)
}
