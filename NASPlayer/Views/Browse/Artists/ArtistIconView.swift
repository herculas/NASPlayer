//
//  ArtistIconView.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import SwiftUI

struct ArtistIconView: View {
    
    var artist: ArtistVM
    @ObservedObject var artistPhotoService: ArtistPhotoService
    
    init(artist: ArtistVM) {
        self.artist = artist
        self.artistPhotoService = ArtistPhotoService(name: artist.name)
    }
    var cardSize: CGFloat {
        let logicalWidth: CGFloat = CGFloat(Device.current.logicalResolution?.width ?? 0.0)
        return (logicalWidth - 56) / 4
    }
    
    var body: some View {
        VStack(alignment: .center) {
            if let photo = self.artistPhotoService.image {
                Image(uiImage: photo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: self.cardSize, height: self.cardSize)
                    .clipShape(.circle)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 0.8)
                            .foregroundStyle(.quinary)
                    }
            } else {
                ProgressView()
                    .frame(width: self.cardSize, height: self.cardSize)
                    .clipShape(.circle)
            }
            
            Text(self.artist.name)
                .font(.footnote)
                .fontWeight(.medium)
                .lineLimit(2)
                .frame(maxWidth: self.cardSize, alignment: .center)
        }
    }
}

#Preview {
    ArtistIconView(artist: ArtistVM.mock)
}
