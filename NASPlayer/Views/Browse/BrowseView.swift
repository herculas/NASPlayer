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
            AlbumSlideView().padding(.vertical)
            ArtistSlideView().padding(.vertical)
            ComposerSlideView().padding(.vertical)
            GenreSlideView().padding(.vertical)
        }
        .navigationTitle("Browse")
        .padding(.horizontal)
    }
}

#Preview {
    BrowseView()
}
