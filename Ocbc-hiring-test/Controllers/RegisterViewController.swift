//
//  RegisterViewController.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 15/02/22.
//

import Foundation
import UIKit

class RegisterController: UIViewController {
    
    lazy var emailTextField: CustomTexField = {
        let tf = CustomTexField(placeholder: "Username")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = CustomTexField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var confirmPasswordTextfield = CustomTexField(placeholder: "Confirm Password")
    
    lazy var signUpBtn: UIButton = {
        let btn = UIButton()
        btn.setSubmitBtn(with: "Register", bgColor: .black, fontColor: .white)
        btn.addTarget(self, action: #selector(backtologin), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, confirmPasswordTextfield])
        stackView.axis = .vertical
        
        
        view.backgroundColor = .white
    
        view.addSubview(stackView)
        view.addSubview(signUpBtn)
        
    
        
        stackView.centerX(inView: view)
        stackView.spacing = 20
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 13, paddingRight: 13)
        
        signUpBtn.centerX(inView: view)
        signUpBtn.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,  right: view.rightAnchor, paddingLeft: 13, paddingBottom: 13, paddingRight: 13)
        
    }
    
    @objc func backtologin() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func signupAction() {
        print("sign up")
    }
    
}
