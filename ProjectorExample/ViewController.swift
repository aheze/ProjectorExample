//
//  ViewController.swift
//  ProjectorExample
//
//  Created by Zheng on 5/28/20.
//  Copyright © 2020 Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentRotation: CGFloat = 0
    
    @IBOutlet weak var yellowView: UIView!
    
    @IBAction func sampleAppPressed(_ sender: Any) {
        if currentRotation == 270 {
            currentRotation = 0
        } else {
            currentRotation += 90
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.yellowView.transform = CGAffineTransform(rotationAngle: self.currentRotation.degreesToRadians)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yellowView.layer.cornerRadius = 16
    }
    
    override var prefersStatusBarHidden: Bool {
         return true
    }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
}
