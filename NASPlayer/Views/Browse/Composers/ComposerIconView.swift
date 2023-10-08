//
//  ComposerIconView.swift
//  NASPlayer
//
//  Created by 宋睿 on 1/10/2023.
//

import SwiftUI

struct ComposerIconView: View {
    
    var composer: ComposerVM
    @ObservedObject var composerPhotoService: ComposerPhotoService
    
    init(composer: ComposerVM) {
        self.composer = composer
        self.composerPhotoService = ComposerPhotoService(name: composer.name)
    }
    
    var cardSize: CGFloat {
        let logicalWidth: CGFloat = Device.current.logicalResolution?.width ?? 0.0
        return (logicalWidth - 56) / 4
    }
        
    var body: some View {
        VStack(alignment: .center) {
            if let photo = self.composerPhotoService.image {
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
            
            Text(self.composer.name)
                .font(.footnote)
                .fontWeight(.medium)
                .lineLimit(2)
                .frame(maxWidth: self.cardSize, alignment: .center)
        }
    }
}

#Preview {
    ComposerIconView(composer: ComposerVM.mock)
}
