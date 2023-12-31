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
        let username = self.usernameTextField.text ?? String()
        let email = self.emailTextField.text ?? String()
        let password = self.passwordTextField.text ?? String()
        
        Task {
            do {
                let result = try await self.signUpViewModel.signUp(username: username, email: email, password: password)
                if result {
                    self.signUpViewModel.goBack()
                }
            } catch let error {
                print(error)
            }
        }
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
            make.top.equalTo(view.snp.topMargin)
            make.leading.equalTo(view.snp.leadingMargin)
            make.trailing.equalTo(view.snp.trailingMargin)
        }
        
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(Constraint.marginVertical)
            make.leading.equalTo(view.snp.leadingMargin)
            make.trailing.equalTo(view.snp.trailingMargin)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(Constraint.marginVertical)
            make.leading.equalTo(view.snp.leadingMargin)
            make.trailing.equalTo(view.snp.trailingMargin)
        }
        
        view.addSubview(createAccountButton)
        createAccountButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(Constraint.marginVertical)
            make.centerX.equalToSuperview()
        }
    }
}

