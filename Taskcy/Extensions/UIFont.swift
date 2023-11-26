//
//  UIFont.swift
//  Taskcy
//
//  Created by 김시연 on 2023/11/21.
//

import Foundation
import UIKit
extension UIFont {
    public enum Poppins: String {

        case thin = "Poppins-Thin"
        case light = "Poppins-Light"
        case regular = "Poppins-Regular"
        case medium = "Poppins-Medium"
        case semiBold = "Poppins-SemiBold"
        case bold = "Poppins-Bold"

        public func font(size: CGFloat) -> UIFont {
            return UIFont(name: self.rawValue, size: size)!
        }
    }
}
