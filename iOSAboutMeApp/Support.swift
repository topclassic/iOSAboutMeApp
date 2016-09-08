//
//  Support.swift
//  iOSAboutMeApp
//
//  Created by Chotipat on 9/9/2559 BE.
//  Copyright © 2559 Chotipat. All rights reserved.
//

import Foundation

class Support: NSObject {

    // Select Color
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func getUIColor(i: Int) -> UIColor {
        var color : UIColor?
        switch i {
        case 0:
            color = UIColorFromRGB(0x00000) //Black
            break;
        case 1:
            color = UIColorFromRGB(0x0BFFF) //deep sky blue
            break;
        default:
            print("False Color")
            break;
        }
        return color!
    }
    //End Select Color
}