//
//  TimeBoardView.swift
//  Taskcy
//
//  Created by 김시연 on 2023/11/27.
//

import Foundation
import UIKit

class TimeBoardView: UIView {
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 60, height: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Todo Label"
        label.font = UIFont.Poppins.medium.font(size: 14)
        label.textColor = .white
        return label
    }()
    
    let timeLabel:UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 60, height: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "time Label"
        label.font = UIFont.Poppins.regular.font(size: 11)
        label.textColor = .white
        return label
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        self.addSubview(titleLabel)
        self.addSubview(timeLabel)
        
        constraintCustomView()
    }
    
    func constraintCustomView() {
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 14),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            timeLabel.heightAnchor.constraint(equalToConstant: 11),
            timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20),
            timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 20)
            

        ])
    }
}
