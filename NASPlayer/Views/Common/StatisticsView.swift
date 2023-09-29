//
//  StatisticsView.swift
//  NASPlayer
//
//  Created by 宋睿 on 21/9/2023.
//

import SwiftUI

struct StatisticsView: View {
    
    var count: Int?
    var duration: Int?
    
    var body: some View {
        if let count = self.count,
           let duration = self.duration {
            if duration / 3600 == 0 {
                Text("\(count) songs, \((duration / 60) % 60) minutes")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 60)
                    
            } else {
                Text("\(count) songs, \(duration / 3600) hours \((duration / 60) % 60) minutes")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 60)
            }
                
        }
    }
}

#Preview {
    AlbumDetailView(album: AlbumVM.mock)
}
