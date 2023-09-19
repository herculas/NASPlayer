//
//  Device+Function.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import Foundation

extension Device {

    /**
     Maps an identifier to a ``Device``. If the identifier cannot be resolved, `unknown(identifier)` will be returned.
     - parameter identifier: The identifier of a ``Device``, e.g.,  `iPhone7,1`. Can be obtained from ``Device.identifier``.
     - returns: An initialized ``Device``.
     */
    public static func mapToDevice(from identifier: String) -> Device {
        switch identifier {
        case "iPhone3,1": return iPhone4
        case "iPhone3,2": return iPhone4
        case "iPhone3,3": return iPhone4
            
        case "iPhone4,1": return iPhone4s
            
        case "iPhone5,1": return iPhone5
        case "iPhone5,2": return iPhone5
        case "iPhone5,3": return iPhone5c
        case "iPhone5,4": return iPhone5c
            
        case "iPhone6,1": return iPhone5s
        case "iPhone6,2": return iPhone5s
            
        case "iPhone7,1": return iPhone6Plus
        case "iPhone7,2": return iPhone6
            
        case "iPhone8,1": return iPhone6s
        case "iPhone8,2": return iPhone6sPlus
        case "iPhone8,4": return iPhoneSE
            
        case "iPhone9,1": return iPhone7
        case "iPhone9,2": return iPhone7Plus
        case "iPhone9,3": return iPhone7
        case "iPhone9,4": return iPhone7Plus
            
        case "iPhone10,1": return iPhone8
        case "iPhone10,2": return iPhone8Plus
        case "iPhone10,3": return iPhoneX
        case "iPhone10,4": return iPhone8
        case "iPhone10,5": return iPhone8Plus
        case "iPhone10,6": return iPhoneX
            
        case "iPhone11,2": return iPhoneXS
        case "iPhone11,4": return iPhoneXSMax
        case "iPhone11,6": return iPhoneXSMax
        case "iPhone11,8": return iPhoneXR
            
        case "iPhone12,1": return iPhone11
        case "iPhone12,3": return iPhone11Pro
        case "iPhone12,5": return iPhone11ProMax
        case "iPhone12,8": return iPhoneSE2
            
        case "iPhone13,1": return iPhone12Mini
        case "iPhone13,2": return iPhone12
        case "iPhone13,3": return iPhone12Pro
        case "iPhone13,4": return iPhone12ProMax
            
        case "iPhone14,2": return iPhone13Pro
        case "iPhone14,3": return iPhone13ProMax
        case "iPhone14,4": return iPhone13Mini
        case "iPhone14,5": return iPhone13
        case "iPhone14,6": return iPhoneSE3
        case "iPhone14,7": return iPhone14
        case "iPhone14,8": return iPhone14Plus
            
        case "iPhone15,2": return iPhone14Pro
        case "iPhone15,3": return iPhone14ProMax
        case "iPhone15,4": return iPhone15
        case "iPhone15,5": return iPhone15Plus
            
        case "iPhone16,2": return iPhone15Pro
        case "iPhone16,3": return iPhone15ProMax
            
        case "i386", "x86_64", "arm64":
            return simulator(
                Device.mapToDevice(from: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS")
            )
            
        default: return unknown(identifier)
        }
    }
    
    /**
     Gets the real device from a ``Device`` instance.
     If the device is an simulator, this function returns the simulated device; otherwise it returns the device itself.
     - returns: the underlying device if the `device` is a `simulator`.
     - parameter device: A ``Device``.
     */
    public static func realDevice(from device: Device) -> Device {
        if case let .simulator(model) = device {
            return model
        }
        return device
    }
        
    /**
     Determines if a device is in a certain collection.
     */
    public func isOneOf(_ devices: [Device]) -> Bool {
        return devices.contains(self)
    }
}
