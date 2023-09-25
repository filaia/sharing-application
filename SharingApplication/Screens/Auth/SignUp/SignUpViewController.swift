//
//  SignUpViewController.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation
import UIKit

final class SignUpViewController: UIViewController {
    
    var signUpViewModel: SignUpViewModel

    init(signUpViewModel: SignUpViewModel) {
        self.signUpViewModel = signUpViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let usernameTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Enter your username"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
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
    
    private lazy var createAccountButton = UIButton(configuration: .tinted(), primaryAction: UIAction(title: "Create an account", handler: { action in
//        let loginVC = LoginViewController()
//        self.present(loginVC, animated: true)
    }))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        dismissKeyboardTouchOutside()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-60)
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
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
        
        view.addSubview(createAccountButton)
        createAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(60)
        }
    }
}

