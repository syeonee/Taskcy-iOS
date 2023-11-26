//
//  SignViewController.swift
//  Taskcy
//
//  Created by 김시연 on 2023/11/21.
//

import UIKit

class SignViewController: UIViewController {
    @IBOutlet weak var navigationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var nameCheckLabel: UILabel!
    @IBOutlet weak var emailCheckLabel: UILabel!
    @IBOutlet weak var passwordCheckLabel: UILabel!
    
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var isNameValid: Bool = false
    var isEmailValid: Bool = false
    var isPasswordValid: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        nameTextField.delegate = self
        nameTextField.makeRoundTextField()
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        emailTextField.delegate = self
        emailTextField.makeRoundTextField()
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        passwordTextField.delegate = self
        passwordTextField.makeRoundTextField()
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        
        signButton.makeRoundButton(enableTextColor: UIColor(named: "FFFFFF")!, disableTextColor: UIColor(named: "FFFFFF")!, radius: 16)
        signButton.makeDisable(backgroundColor: UIColor(named: "E9F1FF")!)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        if textField == nameTextField {
            if nameTextField.text != "" {
                isNameValid = true
                nameCheckLabel.isHidden = true
            }else{
                isNameValid = false
                nameCheckLabel.isHidden = false
            }
        } else if textField == emailTextField {
            if validateEmail(emailTextField.text ?? "") {
                isEmailValid = true
                emailCheckLabel.isHidden = true
            }else{
                isEmailValid = false
                emailCheckLabel.isHidden = false
            }
        } else if textField == passwordTextField {
            if validatePassword(passwordTextField.text ?? "") {
                isPasswordValid = true
                passwordCheckLabel.isHidden = true
            }else{
                isPasswordValid = false
                passwordCheckLabel.isHidden = false
            }
        }
        
        if isNameValid && isEmailValid && isPasswordValid {
            signButton.makeEnable(backgroundColor: UIColor(named: "756EF3")!)
        } else {
            signButton.makeDisable(backgroundColor: UIColor(named: "E9F1FF")!)
        }
        
    }
    
    // 이메일 정규성 체크
    func validateEmail(_ input: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return emailPredicate.evaluate(with: input)
    }
    
    // 패스워드 정규성 체크
    func validatePassword(_ input: String) -> Bool {
        let regex = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}" // 8자리 ~ 50자리 영어+숫자+특수문자
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: input)
    }
 
    @IBAction func backButtonTapped(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
    }
}

extension SignViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == nameTextField {
            nameTextField.makeBeginEditingRoundTextField()
        }else if textField == emailTextField{
            emailTextField.makeBeginEditingRoundTextField()
        }else if textField == passwordTextField{
            passwordTextField.makeBeginEditingRoundTextField()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == nameTextField {
            nameTextField.makeEndEditingRoundTextField()
        }else if textField == emailTextField{
            emailTextField.makeEndEditingRoundTextField()
        }else if textField == passwordTextField{
            passwordTextField.makeEndEditingRoundTextField()
        }
    }
}
 
