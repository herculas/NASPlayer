//
//  ComposerSlideView.swift
//  NASPlayer
//
//  Created by 宋睿 on 30/9/2023.
//

import SwiftUI

struct ComposerSlideView: View {
    
    @ObservedObject var composerListService = ComposerListService(limit: 12)
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Text("Composers")
                    .font(.title3)
                    .fontWeight(.semibold)
                Image(systemName: "chevron.forward")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 24) {
                    if let composers = self.composerListService.composerList?.filter({ $0.name != "" }) {
                        ForEach(composers) { composer in
                            ComposerIconView(composer: composer)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ComposerSlideView()
}
