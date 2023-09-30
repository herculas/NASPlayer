//
//  Device+Screen.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

/**
 Screen-size related parameters.
 */
extension Device {
    
    /// The diagonal length of the screen in inches.
    public var diagonal: Double {
        switch self {
            case .iPhone4: return 3.5
            case .iPhone4s: return 3.5
            case .iPhone5: return 4
            case .iPhone5c: return 4
            case .iPhone5s: return 4
            case .iPhone6: return 4.7
            case .iPhone6Plus: return 5.5
            case .iPhone6s: return 4.7
            case .iPhone6sPlus: return 5.5
            case .iPhone7: return 4.7
            case .iPhone7Plus: return 5.5
            case .iPhoneSE: return 4
            case .iPhone8: return 4.7
            case .iPhone8Plus: return 5.5
            case .iPhoneX: return 5.8
            case .iPhoneXS: return 5.8
            case .iPhoneXSMax: return 6.5
            case .iPhoneXR: return 6.1
            case .iPhone11: return 6.1
            case .iPhone11Pro: return 5.8
            case .iPhone11ProMax: return 6.5
            case .iPhoneSE2: return 4.7
            case .iPhone12: return 6.1
            case .iPhone12Mini: return 5.4
            case .iPhone12Pro: return 6.1
            case .iPhone12ProMax: return 6.7
            case .iPhone13: return 6.1
            case .iPhone13Mini: return 5.4
            case .iPhone13Pro: return 6.1
            case .iPhone13ProMax: return 6.7
            case .iPhoneSE3: return 4.7
            case .iPhone14: return 6.1
            case .iPhone14Plus: return 6.7
            case .iPhone14Pro: return 6.1
            case .iPhone14ProMax: return 6.7
            case .iPhone15: return 6.1
            case .iPhone15Plus: return 6.7
            case .iPhone15Pro: return 6.1
            case .iPhone15ProMax: return 6.7
            case .simulator(let device): return device.diagonal
            case .unknown: return -1
        }
    }
    
    /// The screen aspect ratio as a tuple.
    public var ratio: (width: Double, height: Double) {
        switch self {
            case .iPhone4: return (width: 2, height: 3)
            case .iPhone4s: return (width: 2, height: 3)
            case .iPhone5: return (width: 9, height: 16)
            case .iPhone5c: return (width: 9, height: 16)
            case .iPhone5s: return (width: 9, height: 16)
            case .iPhone6: return (width: 9, height: 16)
            case .iPhone6Plus: return (width: 9, height: 16)
            case .iPhone6s: return (width: 9, height: 16)
            case .iPhone6sPlus: return (width: 9, height: 16)
            case .iPhone7: return (width: 9, height: 16)
            case .iPhone7Plus: return (width: 9, height: 16)
            case .iPhoneSE: return (width: 9, height: 16)
            case .iPhone8: return (width: 9, height: 16)
            case .iPhone8Plus: return (width: 9, height: 16)
            case .iPhoneX: return (width: 9, height: 19.5)
            case .iPhoneXS: return (width: 9, height: 19.5)
            case .iPhoneXSMax: return (width: 9, height: 19.5)
            case .iPhoneXR: return (width: 9, height: 19.5)
            case .iPhone11: return (width: 9, height: 19.5)
            case .iPhone11Pro: return (width: 9, height: 19.5)
            case .iPhone11ProMax: return (width: 9, height: 19.5)
            case .iPhoneSE2: return (width: 9, height: 16)
            case .iPhone12: return (width: 9, height: 19.5)
            case .iPhone12Mini: return (width: 9, height: 19.5)
            case .iPhone12Pro: return (width: 9, height: 19.5)
            case .iPhone12ProMax: return (width: 9, height: 19.5)
            case .iPhone13: return (width: 9, height: 19.5)
            case .iPhone13Mini: return (width: 9, height: 19.5)
            case .iPhone13Pro: return (width: 9, height: 19.5)
            case .iPhone13ProMax: return (width: 9, height: 19.5)
            case .iPhoneSE3: return (width: 9, height: 16)
            case .iPhone14: return (width: 9, height: 19.5)
            case .iPhone14Plus: return (width: 9, height: 19.5)
            case .iPhone14Pro: return (width: 9, height: 19.5)
            case .iPhone14ProMax: return (width: 9, height: 19.5)
            case .iPhone15: return (width: 9, height: 19.5)
            case .iPhone15Plus: return (width: 9, height: 19.5)
            case .iPhone15Pro: return (width: 9, height: 19.5)
            case .iPhone15ProMax: return (width: 9, height: 19.5)
            case .simulator(let device): return device.ratio
            case .unknown: return (width: -1, height: -1)
        }
    }
    
    /// The PPI (pixels per Inch) of the current ``Device``.
    public var ppi: Int? {
        switch self {
            case .iPhone4: return 326
            case .iPhone4s: return 326
            case .iPhone5: return 326
            case .iPhone5c: return 326
            case .iPhone5s: return 326
            case .iPhone6: return 326
            case .iPhone6Plus: return 401
            case .iPhone6s: return 326
            case .iPhone6sPlus: return 401
            case .iPhone7: return 326
            case .iPhone7Plus: return 401
            case .iPhoneSE: return 326
            case .iPhone8: return 326
            case .iPhone8Plus: return 401
            case .iPhoneX: return 458
            case .iPhoneXS: return 458
            case .iPhoneXSMax: return 458
            case .iPhoneXR: return 326
            case .iPhone11: return 326
            case .iPhone11Pro: return 458
            case .iPhone11ProMax: return 458
            case .iPhoneSE2: return 326
            case .iPhone12: return 460
            case .iPhone12Mini: return 476
            case .iPhone12Pro: return 460
            case .iPhone12ProMax: return 458
            case .iPhone13: return 460
            case .iPhone13Mini: return 476
            case .iPhone13Pro: return 460
            case .iPhone13ProMax: return 458
            case .iPhoneSE3: return 326
            case .iPhone14: return 460
            case .iPhone14Plus: return 458
            case .iPhone14Pro: return 460
            case .iPhone14ProMax: return 460
            case .iPhone15: return 460
            case .iPhone15Plus: return 460
            case .iPhone15Pro: return 460
            case .iPhone15ProMax: return 460
            case .simulator(let device): return device.ppi
            case .unknown: return nil
        }
    }
    
    /// The actual redering resolution of the current ``Device``.
    public var logicalResolution: (width: Double, height: Double)? {
        switch self {
            case .iPhone4: return (width: 320, height: 480)
            case .iPhone4s: return (width: 320, height: 480)
            case .iPhone5: return (width: 320, height: 568)
            case .iPhone5c: return (width: 320, height: 568)
            case .iPhone5s: return (width: 320, height: 568)
            case .iPhone6: return (width: 375, height: 667)
            case .iPhone6Plus: return (width: 414, height: 736)
            case .iPhone6s: return (width: 375, height: 667)
            case .iPhone6sPlus: return (width: 414, height: 736)
            case .iPhone7: return (width: 375, height: 667)
            case .iPhone7Plus: return (width: 414, height: 736)
            case .iPhoneSE: return (width: 320, height: 568)
            case .iPhone8: return (width: 375, height: 667)
            case .iPhone8Plus: return (width: 414, height: 736)
            case .iPhoneX: return (width: 375, height: 812)
            case .iPhoneXS: return (width: 375, height: 812)
            case .iPhoneXSMax: return (width: 414, height: 896)
            case .iPhoneXR: return (width: 414, height: 896)
            case .iPhone11: return (width: 414, height: 896)
            case .iPhone11Pro: return (width: 375, height: 812)
            case .iPhone11ProMax: return (width: 414, height: 896)
            case .iPhoneSE2: return (width: 375, height: 667)
            case .iPhone12: return (width: 390, height: 844)
            case .iPhone12Mini: return (width: 375, height: 812)
            case .iPhone12Pro: return (width: 390, height: 844)
            case .iPhone12ProMax: return (width: 428, height: 926)
            case .iPhone13: return (width: 390, height: 844)
            case .iPhone13Mini: return (width: 375, height: 812)
            case .iPhone13Pro: return (width: 390, height: 844)
            case .iPhone13ProMax: return (width: 428, height: 926)
            case .iPhoneSE3: return (width: 375, height: 667)
            case .iPhone14: return (width: 390, height: 844)
            case .iPhone14Plus: return (width: 428, height: 926)
            case .iPhone14Pro: return (width: 393, height: 852)
            case .iPhone14ProMax: return (width: 430, height: 932)
            case .iPhone15: return (width: 393, height: 852)
            case .iPhone15Plus: return (width: 430, height: 932)
            case .iPhone15Pro: return (width: 393, height: 852)
            case .iPhone15ProMax: return (width: 430, height: 932)
            case .simulator(let device): return device.logicalResolution
            case .unknown: return nil
        }
    }
}
