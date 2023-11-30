//
//  AddViewController.swift
//  Taskcy
//
//  Created by 김시연 on 2023/11/26.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var addTodoView: UIView!
    @IBOutlet weak var addEventView: UIView!
    @IBOutlet weak var addProjectView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    

    func setUI(){
        addTodoView.layer.cornerRadius = 12
        addTodoView.layer.borderWidth = 1
        addTodoView.layer.borderColor = UIColor(named: "756EF3")?.cgColor
        
        addEventView.layer.cornerRadius = 12
        addEventView.layer.borderWidth = 1
        addEventView.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
        
        addProjectView.layer.cornerRadius = 12
        addProjectView.layer.borderWidth = 1
        addProjectView.layer.borderColor = UIColor(named: "E9F1FF")?.cgColor
    }

}
