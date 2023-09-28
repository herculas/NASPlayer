//
//  ReducedPlayerView.swift
//  NASPlayer
//
//  Created by 宋睿 on 26/9/2023.
//

import SwiftUI

struct ReducedPlayerView: View {
    
    @Binding var playerExpanded: Bool
    var animation: Namespace.ID
    
    var body: some View {
        ZStack {
            if self.playerExpanded {
                Rectangle()
                    .fill(.clear)
            } else {
                Rectangle()
                    .fill(.thinMaterial)
                    .overlay {
                        ReducedContentView(
                            playerExpanded: self.$playerExpanded,
                            animation: self.animation
                        )
                    }
                    .matchedGeometryEffect(id: "BGVIEW", in: self.animation)
            }
        }
        .frame(height: 60)
        .offset(y: -49)
    }
}

struct ReducedContentView: View {
    @Binding var playerExpanded: Bool
    var animation: Namespace.ID
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack {
                if !self.playerExpanded {
                    GeometryReader {
                        let size = $0.size
                        Image("cover")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width, height: size.height)
                            .clipShape(
                                RoundedRectangle(
                                    cornerRadius: self.playerExpanded ? 15 : 5,
                                    style: .continuous
                                )
                            )
                    }
                    .matchedGeometryEffect(id: "ARTWORK", in: self.animation)
                }
            }
            .frame(width: 40, height: 40)
            Text("花下重门")
                .fontWeight(.semibold)
                .lineLimit(1)
                .padding(.horizontal, 15)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "pause.fill")
                    .font(.title2)
            }
            
            Button {
                
            } label: {
                Image(systemName: "forward.fill")
                    .font(.title2)
            }
            .padding(.leading, 25)
        }
        .foregroundStyle(.foreground)
        .padding(.leading, 7)
        .padding(.trailing, 16)
        .frame(height: 50)
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)) {
                self.playerExpanded = true
            }
        }
    }
}

#Preview {
    MainTabView()
}
