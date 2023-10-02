//
//  GenreSlideView.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import SwiftUI

struct GenreSlideView: View {
    
    @ObservedObject var genreListService = GenreListService(limit: 12)
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Text("Genres")
                    .font(.title3)
                    .fontWeight(.semibold)
                Image(systemName: "chevron.forward")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 24) {
                    if let genres = self.genreListService.genreList {
                        ForEach(genres) { genre in
                            GenreIconView(genre: genre)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GenreSlideView()
}
