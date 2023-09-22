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
        Text(convert(song: count) + convert(duration: duration))
            .font(.system(size: 14))
            .foregroundColor(.gray)
            .padding(.bottom, 60)
            .listRowSeparator(.hidden)
    }
}
