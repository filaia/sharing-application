//
//  SignInViewController.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import UIKit
import SnapKit

final class SignInViewController: UIViewController {
    
    var signInViewModel: SignInViewModel
    
    init(signInViewModel: SignInViewModel) {
        self.signInViewModel = signInViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let emailTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Enter your email addression"
        textField.text = "Test@gmail.com"
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private let passwordTextField: AuthTextField = {
        let textField = AuthTextField()
        textField.placeholder = "Enter your password"
        textField.text = "Password"
        return textField
    }()
    
    private lazy var signInButton = UIButton(configuration: .tinted(), primaryAction: UIAction(title: "Sign in", handler: { action in
        let email = self.emailTextField.text ?? String()
        let password = self.passwordTextField.text ?? String()
        Task {
            do {
                let success = try await self.signInViewModel.signIn(user: SignInUserRequest(email: email, password: password))
                if success {
                    self.signInViewModel.goToFeed()
                }
            } catch {
                print("error")
            }
        }
    }))
    
    private lazy var signUpButton = UIButton(configuration: .borderless(), primaryAction: UIAction(title: "Sign Up", handler: { action in
        self.signInViewModel.goToSignUp()
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
            make.top.equalTo(view.snp.topMargin)
            make.leading.equalTo(view.snp.leadingMargin)
            make.trailing.equalTo(view.snp.trailingMargin)
        }
        
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(Constraint.marginVertical)
            make.leading.equalTo(view.snp.leadingMargin)
            make.trailing.equalTo(view.snp.trailingMargin)
        }
        
        view.addSubview(signInButton)
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField.snp.bottom).offset(Constraint.marginVertical)
        }
        
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom)
        }
    }
}
