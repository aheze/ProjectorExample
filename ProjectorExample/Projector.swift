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
