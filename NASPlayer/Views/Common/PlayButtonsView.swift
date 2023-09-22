//
//  DetailButtonRowView.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import SwiftUI

struct PlayButtonsView: View {
    
    var songs: [Int: [SongVM]]?
    
    var body: some View {
        if let songs = songs {
            HStack(alignment: .center, spacing: 20) {
                Spacer()
                PlayButtonView(name: "Play", icon: "play.fill", padding: songs.count <= 1)
                PlayButtonView(name: "Shuffle", icon: "shuffle", padding: songs.count <= 1)
                Spacer()
            }
            .listRowSeparator(.hidden)
        }
    }
}

struct PlayButtonView: View {
    var name: String
    var icon: String
    var padding: Bool
    
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
        .foregroundColor(.accentColor)
        .clipShape(.rect(cornerRadius: 10))
        .padding(.bottom, padding ? 20 : 0)
    }
}
