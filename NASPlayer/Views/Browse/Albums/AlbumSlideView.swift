//
//  AlbumSlideView.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import SwiftUI

struct AlbumSlideView: View {
    
    @ObservedObject var albumListService = AlbumListService(limit: 6)
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Text("Albums")
                    .font(.title3)
                    .fontWeight(.semibold)
                Image(systemName: "chevron.forward")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 24) {
                    if let albums = self.albumListService.albumList {
                        ForEach(albums) { album in
                            AlbumCoverView(album: album)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AlbumSlideView()
}
