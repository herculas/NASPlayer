//
//  WaveformView.swift
//  NASPlayer
//
//  Created by 宋睿 on 26/9/2023.
//

import SwiftUI

public struct WaveformView: View {

    @State private var lineLengths: [CGFloat] = [5, 20, 30, 15, 25, 10]

    var color: Color = .accentColor
    var animated: Bool = true

    public init(color: Color = .accentColor, animated: Bool = true) {
        self.color = color
        self.animated = animated
    }

    public var body: some View {
        GeometryReader { geo in
            let width = geo.size.width
            let gradient = RadialGradient(
                colors: [color],
                center: UnitPoint.center,
                startRadius: width / 2.5,
                endRadius: width / 2.5 - 1
            )
            Waveform(lineLengths: self.lineLengths)
                .strokeBorder(gradient, style: StrokeStyle(lineWidth: width/16, lineCap: .round), antialiased: true)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .scaledToFit()
                .onAppear {
                    if animated {
                        withAnimation(.linear(duration: 0.7).repeatForever()) {
                            self.lineLengths = [20, 10, 2, 25, 10, 2]
                        }
                    }
                }
        }
    }
}

struct Waveform: InsettableShape {
    var lineLengths: [CGFloat]
    var animatableData: AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, AnimatablePair<CGFloat, CGFloat>>>>> {
        get {
            AnimatablePair(
                self.lineLengths[0],
                AnimatablePair(
                    self.lineLengths[1],
                    AnimatablePair(
                        self.lineLengths[2],
                        AnimatablePair(
                            self.lineLengths[3],
                            AnimatablePair(
                                self.lineLengths[4],
                                self.lineLengths[5]
                            )
                        )
                    )
                )
            )
        }
        
        set {
            self.lineLengths[0] = CGFloat(newValue.first)
            self.lineLengths[1] = CGFloat(newValue.second.first)
            self.lineLengths[2] = CGFloat(newValue.second.second.first)
            self.lineLengths[3] = CGFloat(newValue.second.second.second.first)
            self.lineLengths[4] = CGFloat(newValue.second.second.second.second.first)
            self.lineLengths[5] = CGFloat(newValue.second.second.second.second.second)
        }
    }
    
    var insetAmount = 0.0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
    
    func path(in rect: CGRect) -> Path {
        let w = rect.width/100
        let h = rect.height/100
        
        let lines: [[CGPoint]] = [
            [CGPoint(x: w * 25, y: rect.midY - h * self.lineLengths[0]),
             CGPoint(x: w * 25, y: rect.midY + h * self.lineLengths[0])],
            [CGPoint(x: w * 35, y: rect.midY - h * self.lineLengths[1]),
             CGPoint(x: w * 35, y: rect.midY + h * self.lineLengths[1])],
            [CGPoint(x: w * 45, y: rect.midY - h * self.lineLengths[2]),
             CGPoint(x: w * 45, y: rect.midY + h * self.lineLengths[2])],
            [CGPoint(x: w * 55, y: rect.midY - h * self.lineLengths[3]),
             CGPoint(x: w * 55, y: rect.midY + h * self.lineLengths[3])],
            [CGPoint(x: w * 65, y: rect.midY - h * self.lineLengths[4]),
             CGPoint(x: w * 65, y: rect.midY + h * self.lineLengths[4])],
            [CGPoint(x: w * 75, y: rect.midY - h * self.lineLengths[5]),
             CGPoint(x: w * 75, y: rect.midY + h * self.lineLengths[5])]
        ]
        
        return Path { path in
            for line in lines {
                path.addLines(line)
            }
        }
    }
}

struct WaveformView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            WaveformView().scaledToFit()
            WaveformView(color: .mint).scaledToFit()
            WaveformView(color: .purple).scaledToFit()
            WaveformView(animated: false).scaledToFit()
        }
    }
}
