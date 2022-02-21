//
//  LoginViewController.swift
//  Ocbc-hiring-test
//
//  Created by satriya on 15/02/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
 
    lazy var emailTextField: UITextField = {
        let tf = CustomTexField(placeholder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = CustomTexField(placeholder: "Password")
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    
    lazy var noAccountBtn: UIButton = {
        let bt = UIButton(type: .custom)
        
        bt.setSubmitBtn(with: "Register")
        bt.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        bt.setTitleColor(.black, for: .normal)
        return bt
    }()
    
    lazy var loginButton: UIButton = {
        let bt = UIButton(type: .custom)

        bt.setSubmitBtn(with: "Login", bgColor: .black, fontColor: .white)
        bt.addTarget(self, action: #selector(forgotPassAction), for: .touchUpInside)
        
        return bt
    }()
    
    lazy var errorMessage: UILabel = {
       let lb = UILabel()
        lb.text = "This Field Cannot Be Empty, Default Username is Nama"
        lb.textColor = .red
        lb.font = UIFont.systemFont(ofSize: 10)
        return lb
    }()
    
    let vm = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
    }
    
    @objc func signupAction() {
        let reg = RegisterController()
        self.navigationController?.pushViewController(reg, animated: false)
    }
    
    @objc func loginAction() {
        
    }
    
    @objc func forgotPassAction() {
        
        if emailTextField.text?.isEmpty ?? false {
            errorMessage.isHidden = false
            emailTextField.isError(baseColor: UIColor.red.cgColor, numberOfShakes: 2, revert: true)
        } else {
            let Acc = AccountViewController()
            errorMessage.isHidden = true
            vm.getDatas {
                self.navigationController?.pushViewController(Acc, animated: true)
            }
            
        }
        
        
        
    }
    
}

extension LoginViewController {
    
    private func configUI() {
        
        view.backgroundColor = .white

        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stackView.axis = .vertical
        stackView.spacing = 40
        
        view.addSubview(stackView)
        emailTextField.addSubview(errorMessage)
        
        stackView.centerX(inView: view)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 13, paddingRight: 13 )
        
        view.addSubview(noAccountBtn)
        noAccountBtn.centerX(inView: view)
        noAccountBtn.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,paddingLeft: 20, paddingBottom: 12, paddingRight: 20)
        
        view.addSubview(loginButton)
        loginButton.centerX(inView: view)
        loginButton.anchor(left: view.leftAnchor ,bottom: noAccountBtn.topAnchor, right: view.rightAnchor ,paddingLeft: 20, paddingBottom: 12, paddingRight: 20)
        
        errorMessage.anchor(top: emailTextField.bottomAnchor, paddingTop: 5)
        errorMessage.isHidden = true
        
    }
    
}
