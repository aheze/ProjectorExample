//
//  Projector.swift
//  ProjectorExample
//
//  Created by Zheng on 5/28/20.
//  Copyright © 2020 Zheng. All rights reserved.
//

import UIKit

class Projector {
    static func display(rootWindow: UIWindow, testingSize: CGSize) {
        
        /// the size of the device that you're running your app on
        let myDeviceSize = UIScreen.main.bounds.size
        let myDeviceAspectRatio = myDeviceSize.width / myDeviceSize.height
        
        let testingDeviceAspectRatio = testingSize.width / testingSize.height
        
        /// how much our original window will need to be scaled
        var scalingOfMyDevice = CGFloat(0)
        
        /// We need to figure out which side length we need to convert
        /// because we want the entire simulated screen to fit in our original screen
        if myDeviceAspectRatio < testingDeviceAspectRatio {
            scalingOfMyDevice = myDeviceSize.width / testingSize.width
        } else {
            scalingOfMyDevice = myDeviceSize.height / testingSize.height
        }
        
        /// we're going to change the original window's size to that of the new window
        /// we also want the simulated window to stay in the center of the screen
        /// so here's some simple math to make the simulated window stay in the center of the screen
        let xPosition = (myDeviceSize.width - testingSize.width) / 2
        let yPosition = (myDeviceSize.height - testingSize.height) / 2
        
        let newOrigin = CGPoint(x: xPosition, y: yPosition)
        
        UIView.animate(withDuration: 0.5, animations: {
            rootWindow.frame.origin = newOrigin
            rootWindow.frame.size = testingSize
            rootWindow.transform = CGAffineTransform(scaleX: scalingOfMyDevice, y: scalingOfMyDevice)
        })
    }
}

enum DeviceType {
   
   //MARK: - iPhones
   /**
    iPhone 5, iPhone 5S, iPhone 5C, iPhone SE 1st gen
   */
   case iPhoneSE1
   
   /**
    iPhone 6, iPhone 6S, iPhone 7, iPhone 8, iPhone SE 2nd gen
   */
   case iPhoneSE2
   
   /**
   iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus, iPhone 8 Plus
   */
   case iPhone8Plus
   
   /**
   iPhone X, iPhone XS, iPhone 11 Pro
   */
   case iPhoneX
   
   /**
   iPhone XR, iPhone 11
   */
   case iPhone11
   
   /**
   iPhone XS Max, iPhone 11 Pro Max
   */
   case iPhone11ProMax
   
   
   //MARK: - iPads
   
   /**
   iPad Mini 2nd, 3rd, 4th and 5th Generation
   */
   case iPadMini
   
   /**
   iPad 3rd, iPad 4th, iPad Air 1st, iPad Air 2nd, iPad Pro 9.7-inch, iPad 5th, iPad 6th Generation
   */
   case iPad9_7
   
   /**
   iPad 7th Generation
   */
   case iPad10_2
   
   /**
   iPad Pro 10.5, iPad Air 3rd Generation
   */
   case iPad10_5
   
   /**
   iPad Pro 11-inch 1st and 2nd Generation
   */
   case iPadPro11
   
   /**
   iPad Pro 12.9-inch 1st, 2nd, 3rd and 4th Generation
   */
   case iPadPro12

   func getSize() -> CGSize {
       switch self {
       
       case .iPhoneSE1:
           return CGSize(width: 320, height: 568)
       case .iPhoneSE2:
           return CGSize(width: 375, height: 667)
       case .iPhone8Plus:
           return CGSize(width: 414, height: 736)
       case .iPhoneX:
           return CGSize(width: 375, height: 812)
       case .iPhone11:
           return CGSize(width: 414, height: 896)
       case .iPhone11ProMax:
           return CGSize(width: 414, height: 896)
       case .iPadMini:
           return CGSize(width: 768, height: 1024)
       case .iPad9_7:
           return CGSize(width: 768, height: 1024)
       case .iPad10_2:
           return CGSize(width: 810, height: 1080)
       case .iPad10_5:
           return CGSize(width: 834, height: 1112)
       case .iPadPro11:
           return CGSize(width: 834, height: 1194)
       case .iPadPro12:
           return CGSize(width: 1024, height: 1366)
       }
   }
}
