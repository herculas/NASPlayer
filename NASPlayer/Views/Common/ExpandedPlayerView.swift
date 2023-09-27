//
//  ExpandedPlayerView.swift
//  NASPlayer
//
//  Created by 宋睿 on 26/9/2023.
//

import SwiftUI

struct ExpandedPlayerView: View {
    
    @State private var animatedContent = false
    @State private var offset: CGFloat = 0
    
    @Binding var playerExpanded: Bool
    var animation: Namespace.ID
    
    var body: some View {
        if self.playerExpanded {
            GeometryReader {
                let size = $0.size
                let safeArea = $0.safeAreaInsets
                
                ZStack {
                    // MARK: - background
                    RoundedRectangle(
                        cornerRadius: self.animatedContent ? self.deviceCornerRadius : 0,
                        style: .continuous
                    )
                    .fill(.thinMaterial)
                    .overlay {
                        RoundedRectangle(
                            cornerRadius: self.animatedContent ? self.deviceCornerRadius : 0,
                            style: .continuous
                        )
                        .fill(Color.lightGray)
                        .opacity(self.animatedContent ? 1 : 0)
                    }
                    .overlay(alignment: .top) {
                        ReducedContentView(
                            playerExpanded: self.$animatedContent,
                            animation: self.animation
                        )
                        .allowsHitTesting(false)
                        .opacity(self.animatedContent ? 0 : 1)
                    }
                    .matchedGeometryEffect(id: "BGVIEW", in: self.animation)
                    
                    // MARK: - contents
                    VStack(spacing: 15) {
                        
                        // drag indicator
                        Capsule()
                            .fill(.secondary)
                            .frame(width: 40, height: 5)
                            .opacity(self.animatedContent ? 1 : 0)
                            .offset(y: self.animatedContent ? 0 : size.height)
                        
                        // cover
                        if self.animatedContent {
                            GeometryReader {
                                let size = $0.size
                                Image("cover")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size.width, height: size.height)
                                    .clipShape(RoundedRectangle(cornerRadius: self.animatedContent ? 15 : 5, style: .continuous))
                            }
                            .matchedGeometryEffect(id: "ARTWORK", in: self.animation)
                            .frame(height: size.width - 50)
                            .padding(.vertical, size.height < 700 ? 10 : 30)
                        }
                        
                        // control panel
                        PlayerView(size)
                            .offset(y: self.animatedContent ? 0 : size.height)
                    }
                    .padding(.top, safeArea.top + (safeArea.bottom == 0 ? 10 : 0))
                    .padding(.bottom, safeArea.bottom == 0 ? 10 : safeArea.bottom)
                    .padding(.horizontal, 25)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                    .clipped()
                }
                .contentShape(Rectangle())
                .offset(y: self.offset)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            let translation = value.translation.height
                            self.offset = translation > 0 ? translation : 0
                        }).onEnded({ value in
                            withAnimation(.easeInOut(duration: 0.3)) {
                                if self.offset > size.height * 0.4 {
                                    self.playerExpanded = false
                                    self.animatedContent = false
                                } else {
                                    self.offset = .zero
                                }
                            }
                        })
                )
                .ignoresSafeArea(.container, edges: .all)
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 0.35)) {
                    self.offset = 0
                    self.animatedContent = true
                }
            }
            
        }
    }
    
    @ViewBuilder
    func PlayerView(_ mainSize: CGSize) -> some View {
        GeometryReader {
            let size = $0.size
            let spacing = size.height * 0.04
            
            VStack(spacing: spacing) {
                VStack(spacing: spacing) {
                    // title and artist
                    HStack(alignment: .center, spacing: 15) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("花下重门")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(.background)
                            Text("上海烛龙")
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis.circle.fill")
                                .foregroundStyle(.background)
                                .font(.title2)
                                .opacity(0.7)
                        }
                    }
                    
                    // playing process
                    Capsule()
                        .fill(.ultraThinMaterial)
                        .environment(\.colorScheme, .light)
                        .frame(height: 5)
                        .padding(.top, spacing)
                    
                    // time elapsed and left
                    HStack {
                        Text("0:00")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .opacity(0.5)
                        Spacer()
                        Text("3:33")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .opacity(0.5)
                    }
                }
                .frame(height: size.height / 2.5, alignment: .top)
                
                // playback controls
                HStack(spacing: size.width * 0.18) {
                    Button {
                        
                    } label: {
                        Image(systemName: "backward.fill")
                            .font(size.height < 300 ? .title3 : .title)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "pause.fill")
                            .font(size.height < 300 ? .largeTitle : .system(size: 50))
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "forward.fill")
                            .font(size.height < 300 ? .title3 : .title)
                    }
                }
                .foregroundStyle(.background)
                .frame(maxHeight: .infinity, alignment: .center)
                
                // volume and other controls
                VStack(spacing: spacing) {
                    HStack(spacing: 15) {
                        Image(systemName: "speaker.fill")
                            .foregroundStyle(.gray)
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .environment(\.colorScheme, .light)
                            .frame(height: 5)
                        Image(systemName: "speaker.wave.3.fill")
                            .foregroundStyle(.gray)
                    }
                    
                    HStack(alignment: .top, spacing: size.width * 0.18) {
                        Button {
                            
                        } label: {
                            Image(systemName: "quote.bubble")
                                .font(.title2)
                        }
                        
                        VStack(spacing: 3) {
                            Button {
                                
                            } label: {
                                Image(systemName: "airpods.gen3")
                                    .font(.title2)
                            }
                            
                            Text("Jon's Airpods")
                                .font(.caption)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "list.bullet")
                                .font(.title2)
                        }
                    }
                    .foregroundStyle(.background)
                    .opacity(0.6)
                    .padding(.top, spacing)
                }
                .frame(height: size.height / 2.5, alignment: .bottom)
            }
        }
    }
}

#Preview {
    MainTabView()
}
