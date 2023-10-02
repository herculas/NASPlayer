//
//  BrowseView.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 24) {
                AlbumSlideView()
                ArtistSlideView()
                ComposerSlideView()
                GenreSlideView()
            }
            Spacer().frame(height: 60)
        }
        .navigationTitle("Browse")
        .padding(.horizontal)
    }
}

#Preview {
    BrowseView()
}
