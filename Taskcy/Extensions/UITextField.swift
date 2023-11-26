//
//  UITextField.swift
//  Taskcy
//
//  Created by 김시연 on 2023/11/21.
//

import Foundation
import UIKit

extension UITextField {
    func makeRoundTextField(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        self.layer.cornerRadius = 16
        
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height)) //왼쪽 공백 넣어주는 코드
        self.leftViewMode = .always
        
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height)) //오른쪽 공백 넣어주는 코드
        self.rightViewMode = .always
    }
    
    func makeBeginEditingRoundTextField(){
        self.layer.borderColor = UIColor(named: "756EF3")?.cgColor
    }
    
    func makeEndEditingRoundTextField(){
        self.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
    }

}
