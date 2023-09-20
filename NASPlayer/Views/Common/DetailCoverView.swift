//
//  SongCoverView.swift
//  NASPlayer
//
//  Created by 宋睿 on 20/9/2023.
//

import SwiftUI

struct DetailCoverView: View {
    
    var cover: UIImage?
    
    var body: some View {
        HStack {
            Spacer()
            if let cover = cover {
                VStack {
                    Image(uiImage: cover)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .frame(maxWidth: 280, maxHeight: 280)
                        .shadow(radius: 5)
                        .padding(.bottom, 5)
                }
                .frame(height: 280)
            } else {
                ProgressView()
                    .frame(width: 280, height: 280)
            }
            Spacer()
        }
        .listRowSeparator(.hidden)
    }
}

#Preview {
    DetailCoverView()
}
