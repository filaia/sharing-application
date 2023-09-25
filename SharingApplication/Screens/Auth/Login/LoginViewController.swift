//
//  LoginViewController.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    var loginViewModel: LoginViewModel
    
    init(loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let emailTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Enter your email addression"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Enter your password"
        return textField
    }()
    
    private lazy var loginButton = UIButton(configuration: .tinted(), primaryAction: UIAction(title: "Login", handler: { action in
        let email = self.emailTextField.text ?? ""
        self.loginViewModel.goToFeed(with: User(email: email))
    }))
    
    private lazy var signUpButton = UIButton(configuration: .borderless(), primaryAction: UIAction(title: "Sign Up", handler: { action in
        self.loginViewModel.goToSignUp()
    }))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        dismissKeyboardTouchOutside()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
            make.width.equalToSuperview().multipliedBy(0.8)
        }

        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(20)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(60)
        }
        
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(100)
        }
    }
}

