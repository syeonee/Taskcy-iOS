//
//  UIButton.swift
//  Taskcy
//
//  Created by 김시연 on 2023/11/07.
//

import Foundation
import UIKit

extension UIButton {
    func makeRoundButton(enableTextColor: UIColor, disableTextColor: UIColor, radius: CGFloat){
        self.setTitleColor(enableTextColor, for: .normal)
        self.setTitleColor(disableTextColor, for: .disabled)
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    func makeEnable(backgroundColor: UIColor) {
        self.isEnabled = true
        self.backgroundColor = backgroundColor
    }
    
    func makeDisable(backgroundColor: UIColor) {
        self.isEnabled = false
        self.backgroundColor = backgroundColor
    }

}
