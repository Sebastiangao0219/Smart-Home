//
//  ColorExtension.swift
//  Smart Home
//
//  Created by Sebastian Gao on 3/9/21.
//

import Foundation

//UIColor is in here
import UIKit

extension UIColor {
    
    static let garageSlideDownLightColor = UIColor().colorFromHex("69693c")
    static let garageSlideUpLightColor = UIColor().colorFromHex("e8e84a")
    static let garageLightOnColor = UIColor().colorFromHex("ffffb0")
    static let garageNameColor = UIColor().colorFromHex("03fcb6")
    
    static let bedroomLightOn = UIColor().colorFromHex("73f8ff")
    static let bedroomLightOff = UIColor().colorFromHex("469094")
    
    static let guestBedroomLightOn = UIColor().colorFromHex("bffff4")
    static let guestBedroomLightOff = UIColor().colorFromHex("56c4b2")
    
    static let getOvenStartColor = UIColor().colorFromHex("ff7966")
    static let getOvenStopColor = UIColor().colorFromHex("fcd2cc")
    
    static let getDishWasherStartColor = UIColor().colorFromHex("6efbff")
    static let getDishWasherStopColor = UIColor().colorFromHex("4dd2d6")
    
    static let getMasterBathRoomBackgroundColor = UIColor().colorFromHex("0a2238")
    static let getMasterBathRoomLightOnColor = UIColor().colorFromHex("bbebed")
    
    static let textBlue = UIColor().colorFromHex("17a6e3")
    static let textGolden = UIColor().colorFromHex("edae0e")

    
    func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            return UIColor.black
        }
        
        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgb & 0x0000FF) / 255.0, alpha: 1.0)
    }
}
