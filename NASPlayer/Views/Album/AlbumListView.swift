//
//  AlbumListView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct AlbumListView: View {
    
    @ObservedObject var albumListRequest = AlbumListRequest()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 5)], spacing: 0) {
                if let albums = self.albumListRequest.albumList {
                    ForEach(albums) { album in
                        NavigationLink {
                            AlbumDetailView(album: album)
                        } label: {
                            AlbumCardView(album: album).padding(.vertical, 10)
                        }
                    }
                }
            }
            Spacer()
                .frame(height: 60)
        }
        .navigationTitle("Albums")
        .padding(.horizontal)
    }
}

#Preview {
    AlbumListView()
}
