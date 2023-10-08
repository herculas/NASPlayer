//
//  AlbumCardView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct AlbumCardView: View {
    
    var album: AlbumVM
    @ObservedObject var albumCoverService: AlbumCoverService
    
    init(album: AlbumVM) {
        self.album = album
        self.albumCoverService = AlbumCoverService(album: album)
    }
    
    var cardSize: CGFloat {
        let logicalWidth: CGFloat = Device.current.logicalResolution?.width ?? 0.0
        return (logicalWidth - 56) / 2
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let cover = self.albumCoverService.image {
                Image(uiImage: cover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: self.cardSize, height: self.cardSize)
                    .clipShape(.rect(cornerRadius: 12))
                    .shadow(radius: 4, x: 0, y: 0)
            } else {
                ProgressView()
                    .frame(width: self.cardSize, height: self.cardSize)
            }
            
            Text(self.album.name)
                .font(.callout)
                .fontWeight(.medium)
                .lineLimit(1)
                .frame(maxWidth: self.cardSize, alignment: .leading)
            
            Text(self.album.albumArtist)
                .font(.caption)
                .foregroundStyle(.gray)
                .lineLimit(1)
                .frame(maxWidth: self.cardSize, alignment: .leading)
        }
    }
}

#Preview {
    AlbumListView()
}
