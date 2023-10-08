//
//  ArtistSlideView.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import SwiftUI

struct ArtistSlideView: View {
    
    @StateObject var artistListService = ArtistListService(limit: 12)
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Text("Artists")
                    .font(.title3)
                    .fontWeight(.semibold)
                Image(systemName: "chevron.forward")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 24) {
                    if let artists = self.artistListService.artistList {
                        ForEach(artists) { artist in
                            ArtistIconView(artist: artist)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ArtistSlideView()
}
