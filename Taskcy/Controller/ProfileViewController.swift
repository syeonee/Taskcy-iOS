//
//  ProfileViewController.swift
//  Taskcy
//
//  Created by 김시연 on 2023/11/26.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var myTaskView: UIView!
    @IBOutlet weak var settingsView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    

    func setUI(){
        profileImageView.layer.cornerRadius = 50
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        
        editButton.layer.cornerRadius = 8
        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        
        myTaskView.layer.cornerRadius = 12
        myTaskView.layer.borderWidth = 1
        myTaskView.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        
        settingsView.layer.cornerRadius = 12
        settingsView.layer.borderWidth = 1
        settingsView.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
    }

}
