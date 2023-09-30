//
//  Device+Collections.swift
//  NASPlayer
//
//  Created by 宋睿 on 19/9/2023.
//

/**
 Collections of enumerations.
 */
extension Device {
    
    // MARK: real devices
    
    /// All iPhone models.
    public static var iPhones: [Device] {
        return [
            .iPhone4, .iPhone4s,
            .iPhone5, .iPhone5c, .iPhone5s,
            .iPhone6, .iPhone6Plus, .iPhone6s, .iPhone6sPlus,
            .iPhone7, .iPhone7Plus,
            .iPhoneSE,
            .iPhone8, .iPhone8Plus,
            .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR,
            .iPhone11, .iPhone11Pro, .iPhone11ProMax,
            .iPhoneSE2,
            .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax,
            .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax,
            .iPhoneSE3,
            .iPhone14, .iPhone14Plus, .iPhone14Pro, .iPhone14ProMax,
            .iPhone15, .iPhone15Plus, .iPhone15Pro, .iPhone15ProMax,
        ]
    }
    
    /// iPhones that feature a sensor housing in the screen.
    public static var sensorHousingFeaturediPhones: [Device] {
        return [
            .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR,
            .iPhone11, .iPhone11Pro, .iPhone11ProMax,
            .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax,
            .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax,
            .iPhone14, .iPhone14Plus, .iPhone14Pro, .iPhone14ProMax,
            .iPhone15, .iPhone15Plus, .iPhone15Pro, .iPhone15ProMax,
        ]
    }
    
    /// Mini-sized iPhones.
    public static var miniSizediPhones: [Device] {
        return [
            .iPhone12Mini,
            .iPhone13Mini,
        ]
    }
    
    /// Plus and max-sized iPhones.
    public static var plusSizediPhones: [Device] {
        return [
            .iPhone6Plus, .iPhone6sPlus,
            .iPhone7Plus,
            .iPhone8Plus,
            .iPhoneXSMax,
            .iPhone11ProMax,
            .iPhone12ProMax,
            .iPhone13ProMax,
            .iPhone14Plus, .iPhone14ProMax,
            .iPhone15Plus, .iPhone15ProMax,
        ]
    }
    
    /// iPhones with pro suffix.
    public static var proFeaturediPhones: [Device] {
        return [
            .iPhone11Pro, .iPhone11ProMax,
            .iPhone12Pro, .iPhone12ProMax,
            .iPhone13Pro, .iPhone13ProMax,
            .iPhone14Pro, .iPhone14ProMax,
            .iPhone15Pro, .iPhone15ProMax,
        ]
    }
    
    /// iPhones that features a touch ID.
    public static var touchIDFeaturediPhones: [Device] {
        return [
            .iPhone5s,
            .iPhone6, .iPhone6Plus,
            .iPhone6s, .iPhone6sPlus,
            .iPhone7, .iPhone7Plus,
            .iPhone8, .iPhone8Plus,
            .iPhoneSE, .iPhoneSE2, .iPhoneSE3,
        ]
    }
    
    /// iPhones that features a face ID.
    public static var faceIDFeaturediPhones: [Device] {
        return [
            .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR,
            .iPhone11, .iPhone11Pro, .iPhone11ProMax,
            .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax,
            .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax,
            .iPhone14, .iPhone14Plus, .iPhone14Pro, .iPhone14ProMax,
            .iPhone15, .iPhone15Plus, .iPhone15Pro, .iPhone15ProMax,
        ]
    }
    
    /// iPhones that features a Dynamic Island.
    public static var dynamicIslandFeaturediPhones: [Device] {
        return [
            .iPhone14Pro, .iPhone14ProMax,
            .iPhone15, .iPhone15Plus, .iPhone15Pro, .iPhone15ProMax,
        ]
    }
    
    /// iPhones that features a screen with rounded corners.
    public static var roundedCornerediPhones: [Device] {
        return [
            .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR,
            .iPhone11, .iPhone11Pro, .iPhone11ProMax,
            .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax,
            .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax,
            .iPhone14, .iPhone14Plus, .iPhone14Pro, .iPhone14ProMax,
            .iPhone15, .iPhone15Plus, .iPhone15Pro, .iPhone15ProMax,
        ]
    }
    
    /// iPhones that supports 3D touch.
    public static var threeDimentionalTouchSupportediPhones: [Device] {
        return [
            .iPhone6s, .iPhone6sPlus,
            .iPhone7, .iPhone7Plus,
            .iPhone8, .iPhone8Plus,
            .iPhoneX, .iPhoneXS, .iPhoneXSMax,
        ]
    }
    
    /// iPhones that supports wireless charging.
    public static var wirelessChargingSupportediPhones: [Device] {
        return [
            .iPhone8, .iPhone8Plus,
            .iPhoneX, .iPhoneXS, .iPhoneXSMax, .iPhoneXR,
            .iPhone11, .iPhone11Pro, .iPhone11ProMax,
            .iPhoneSE2,
            .iPhone12, .iPhone12Mini, .iPhone12Pro, .iPhone12ProMax,
            .iPhone13, .iPhone13Mini, .iPhone13Pro, .iPhone13ProMax,
            .iPhoneSE3,
            .iPhone14, .iPhone14Plus, .iPhone14Pro, .iPhone14ProMax,
            .iPhone15, .iPhone15Plus, .iPhone15Pro, .iPhone15ProMax,
        ]
    }
    
    /// iPhones that features a LiDAR sensor.
    public static var lidarFeaturediPhones: [Device] {
        return [
            .iPhone12Pro, .iPhone12ProMax,
            .iPhone13Pro, .iPhone13ProMax,
            .iPhone14Pro, .iPhone14ProMax,
            .iPhone15Pro, .iPhone15ProMax,
        ]
    }
    
    // MARK: simulators
    
    /// iPhones executed in simulators.
    public static var simulatediPhones: [Device] {
        return Device.iPhones.map(Device.simulator)
    }
    
    /// iPhones that feature a sensor housing in the screen executed in simulators.
    public static var simulatedSensorHousingFeaturediPhones: [Device] {
        return Device.sensorHousingFeaturediPhones.map(Device.simulator)
    }
    
    /// Mini-sized iPhones executed in simulators.
    public static var simulatedMiniSizediPhones: [Device] {
        return Device.miniSizediPhones.map(Device.simulator)
    }
    
    /// Plus and max-sized iPhones executed in simulators..
    public static var simulatedPlusSizediPhones: [Device] {
        return Device.plusSizediPhones.map(Device.simulator)
    }
    
    /// Pro iPhones executed in simulators.
    public static var simulatedProFeaturediPhones: [Device] {
        return Device.proFeaturediPhones.map(Device.simulator)
    }
}

