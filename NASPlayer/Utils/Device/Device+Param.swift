//
//  Device+Param.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

import UIKit

extension Device {
    
        /// A ``Device`` representing the current device on which this application runs.
    public static var current: Device {
        return Device.mapToDevice(from: Device.identifier)
    }
    
        /// An identifier from the system, such as `iPhone7,1`.
    public static var identifier: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let mirror = Mirror(reflecting: systemInfo.machine)
        
        let identifier = mirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }()
    
        /// If this device is a simulator, return the underlying device, otherwise return itself.
    public var realDevice: Device {
        return Device.realDevice(from: self)
    }
    
        /// The brightness level of the screen.
    public var screenBrightness: Int {
        return Int(UIScreen.main.brightness * 100)
    }
    
        /// Whether this device is an iPhone, real or simulated.
    public var isiPhone: Bool {
        return self.isOneOf(Device.iPhones) || self.isOneOf(Device.simulatediPhones)
    }
    
        // MARK: feature test
    
        /// Whether this device has a Touch ID senser.
    public var hasTouchID: Bool {
        return self.isOneOf(Device.touchIDFeaturediPhones)
        || self.isOneOf(Device.touchIDFeaturediPhones.map(Device.simulator))
    }
    
        /// Whether this device has a Face ID senser.
    public var hasFaceID: Bool {
        return self.isOneOf(Device.faceIDFeaturediPhones)
        || self.isOneOf(Device.faceIDFeaturediPhones.map(Device.simulator))
    }
    
        /// Whether this device has a biometric sensor, i.e., a Touch ID or a Face ID.
    public var hasBiometricSenser: Bool {
        return self.hasFaceID || self.hasTouchID
    }
    
        /// Whether this device has a sensor housing.
    public var hasSensorHousing: Bool {
        return self.isOneOf(Device.sensorHousingFeaturediPhones)
        || self.isOneOf(Device.sensorHousingFeaturediPhones.map(Device.simulator))
    }
    
        /// Whether this device has a dynamic island.
    public var hasDynamicIsland: Bool {
        return self.isOneOf(Device.dynamicIslandFeaturediPhones)
        || self.isOneOf(Device.dynamicIslandFeaturediPhones.map(Device.simulator))
    }
    
        /// Whether this device has a screen with rounded corners.
    public var hasRoundedCorners: Bool {
        return self.isOneOf(Device.roundedCornerediPhones)
        || self.isOneOf(Device.roundedCornerediPhones.map(Device.simulator))
    }
    
        /// Whether this device supports 3D touch.
    public var has3DTouchSupport: Bool {
        return self.isOneOf(Device.threeDimentionalTouchSupportediPhones)
        || self.isOneOf(Device.threeDimentionalTouchSupportediPhones.map(Device.simulator))
    }
    
        /// Whether this device supports wireless charging.
    public var hasWirelessChargingSupport: Bool {
        return self.isOneOf(Device.wirelessChargingSupportediPhones)
        || self.isOneOf(Device.wirelessChargingSupportediPhones.map(Device.simulator))
    }
    
        /// Whether this device has a LiDAR sensor.
    public var hasLidarSensor: Bool {
        return self.isOneOf(Device.lidarFeaturediPhones)
        || self.isOneOf(Device.lidarFeaturediPhones.map(Device.simulator))
    }
    
        /// Whether this device is a SwiftUI preview canvas.
    public var isCanvas: Bool? {
        guard self.isCurrent else {
            return nil
        }
#if DEBUG
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
#else
        return false
#endif
    }
    
        /// Whether a Guided Access Session is currently active.
    public var isGuidedAccessSessionActive: Bool {
#if swift(>=4.2)
        return UIAccessibility.isGuidedAccessEnabled
#else
        return UIAccessibilityIsGuidedAccessEnabled()
#endif
    }
    
        /// Whether the current device is the current device.
    private var isCurrent: Bool {
        return self == Device.current
    }
    
        // MARK: device constants
    
        /// The name that can identify this device, e.g., "Ray's iPhone".
    public var name: String? {
        guard self.isCurrent else {
            return nil
        }
        return UIDevice.current.name
    }
    
        /// The name of the OS.
    public var systemName: String? {
        guard self.isCurrent else {
            return nil
        }
        return UIDevice.current.systemName
    }
    
        /// The version of the OS.
    public var systemVersion: String? {
        guard self.isCurrent else {
            return nil
        }
        return UIDevice.current.systemVersion
    }
    
        /// The model of the current device.
    public var model: String? {
        guard self.isCurrent else {
            return nil
        }
        return UIDevice.current.model
    }
    
        /// The model of the current device as a localized string.
    public var localizedModel: String? {
        guard self.isCurrent else {
            return nil
        }
        return UIDevice.current.localizedModel
    }
    
}
