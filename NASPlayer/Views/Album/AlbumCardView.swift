//
//  AlbumCardView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct AlbumCardView: View {
    
    var album: AlbumVM
    @ObservedObject var albumCoverRequest: AlbumCoverRequest
    
    init(album: AlbumVM) {
        self.album = album
        self.albumCoverRequest = AlbumCoverRequest(album: self.album)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let cover = self.albumCoverRequest.image {
                Image(uiImage: cover)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 180)
                    .cornerRadius(12)
                    .shadow(radius: 5, x: 0, y: 0)
            } else {
                ProgressView()
                    .frame(width: 180, height: 180)
            }
            
            Text(album.name)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .lineLimit(1)
                .frame(maxWidth: 175, alignment: .leading)
            
            Text(album.albumArtist)
                .font(.system(size: 12))
                .fontWeight(.regular)
                .foregroundColor(.lightGray)
                .lineLimit(1)
                .frame(maxWidth: 175, alignment: .leading)
        }
    }
}

#Preview {
    AlbumCardView(album: AlbumVM.mock)
}
