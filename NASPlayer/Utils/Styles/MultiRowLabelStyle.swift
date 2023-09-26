//
//  MultiRowLabelStyle.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

struct MultiRowLabelStyle: LabelStyle {
    var width: CGFloat?
    
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center) {
            configuration.icon
                .frame(width: self.width ?? 30, alignment: .center)
            configuration.title
        }
    }
}
