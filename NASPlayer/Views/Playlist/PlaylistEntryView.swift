//
//  PlaylistEntryView.swift
//  NASPlayer
//
//  Created by 宋睿 on 20/9/2023.
//

import SwiftUI

struct PlaylistEntryView: View {
    
    var playlist: PlaylistVM
    @ObservedObject var playlistCoverService: PlaylistCoverService
    
    init(playlist: PlaylistVM) {
        self.playlist = playlist
        self.playlistCoverService = PlaylistCoverService(id: playlist.id)
    }
    
    var safeWidth: CGFloat {
        let logicalWidth: CGFloat = CGFloat(Device.current.logicalResolution?.width ?? 0.0)
        return logicalWidth - 120
    }
    
    var body: some View {
        HStack(spacing: 20) {
            if let cover = self.playlistCoverService.image {
                Image(uiImage: cover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(.rect(cornerRadius: 8))
                    .shadow(radius: 3)
            } else {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            
            Text(self.playlist.name)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: self.safeWidth, alignment: .leading)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
    }
}

#Preview {
    PlaylistEntryView(playlist: PlaylistVM.mock)
}
