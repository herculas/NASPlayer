//
//  GenreIconView.swift
//  NASPlayer
//
//  Created by 宋睿 on 1/10/2023.
//

import SwiftUI

struct GenreIconView: View {
    
    var genre: GenreVM
    @ObservedObject var genrePhotoService: GenrePhotoService
    
    init(genre: GenreVM) {
        self.genre = genre
        self.genrePhotoService = GenrePhotoService(name: genre.name)
    }
    
    var cardSize: CGFloat {
        let logicalWidth: CGFloat = Device.current.logicalResolution?.width ?? 0.0
        return (logicalWidth - 56) / 4
    }
    
    var body: some View {
        VStack(alignment: .center) {
            if let photo = self.genrePhotoService.image {
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
            
            Text(self.genre.name)
                .font(.footnote)
                .fontWeight(.medium)
                .lineLimit(2)
                .frame(maxWidth: self.cardSize, alignment: .center)
        }
    }
}

#Preview {
    GenreIconView(genre: GenreVM.mock)
}
