//
//  Color+.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let r = Double((hex >> 16) & 0xff) / 255
        let g = Double((hex >> 08) & 0xff) / 255
        let b = Double((hex >> 00) & 0xff) / 255
        
        self.init(.sRGB, red: r, green: g, blue: b, opacity: alpha)
    }
    
    init(hex: String) {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        
        var hexLiteral: String = hex
        var hexValue: CUnsignedLongLong = 0
        
        if hexLiteral.hasPrefix("#") {
            let index = hexLiteral.index(hexLiteral.startIndex, offsetBy: 1)
            hexLiteral = String(hexLiteral[index...])
        }
        
        let scanner = Scanner(string: hexLiteral)
        if scanner.scanHexInt64(&hexValue) {
            switch hexLiteral.count {
            case 3:
                r = CGFloat((hexValue & 0xF00) >> 8) / 15.0
                g = CGFloat((hexValue & 0x0F0) >> 4) / 15.0
                b = CGFloat(hexValue & 0x00F) / 15.0
            case 4:
                r = CGFloat((hexValue & 0xF000) >> 12) / 15.0
                g = CGFloat((hexValue & 0x0F00) >> 8) / 15.0
                b = CGFloat((hexValue & 0x00F0) >> 4) / 15.0
            case 6:
                r = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
                g = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
                b = CGFloat(hexValue & 0x0000FF) / 15.0
            case 8:
                r = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                g = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                b = CGFloat((hexValue & 0x0000FF00) >> 8) / 255.0
            default:
                fatalError("[Color] Invalid RGB string \(hex) with wrong number of digits.")
            }
        } else {
            fatalError("[Color] Scan error for RGB string \(hex).")
        }
        self.init(.sRGB, red: r, green: g, blue: b)
    }
    
    func toUIColor() -> UIColor {
        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }
    
    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        var hex: UInt64 = 0
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        let scanner = Scanner(string: self.description.trimmingCharacters(in: .alphanumerics.inverted))
        if scanner.scanHexInt64(&hex) {
            r = CGFloat((hex & 0xff000000) >> 24) / 255
            g = CGFloat((hex & 0x00ff0000) >> 16) / 255
            b = CGFloat((hex & 0x0000ff00) >> 08) / 255
            a = CGFloat((hex & 0x000000ff) >> 00) / 255
        } else {
            fatalError("[Color] Scan error for hex value.")
        }
        return (r, g, b, a)
    }
}

extension Color {
    static let lightRed = Color(#colorLiteral(red: 1, green: 0.21, blue: 0.37, alpha: 1))
    static let paleGray = Color(#colorLiteral(red: 0.9467977881, green: 0.9467977881, blue: 0.9467977881, alpha: 1))
    static let lightGray = Color(#colorLiteral(red: 0.44, green: 0.44, blue: 0.44, alpha: 1.00))
    static let extraLightGray = Color(#colorLiteral(red: 0.65, green: 0.65, blue: 0.65, alpha: 1.00))
    static let darkGray = Color(#colorLiteral(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.00))
    static let extraDarkGray = Color(#colorLiteral(red: 0.17, green: 0.17, blue: 0.18, alpha: 1.00))
    static let lightBlack = Color(#colorLiteral(red: 0.13, green: 0.13, blue: 0.14, alpha: 1.00))
}
