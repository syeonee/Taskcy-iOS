//
//  ViewController.swift
//  Taskcy
//
//  Created by 김시연 on 2023/09/04.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        bottomView.layer.cornerRadius = 30
        bottomView.layer.masksToBounds = true
        
        startButton.makeRoundButton(enableTextColor: UIColor(named: "FFFFFF")!, disableTextColor: UIColor(named: "8D8D8D")!, radius: 15)
        
    }


}

