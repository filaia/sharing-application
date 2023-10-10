//
//  AuthTextField.swift
//  SharingApplication
//
//  Created by Philip Zakharov on 25.09.2023.
//

import Foundation
import UIKit

final class AuthTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.borderStyle = .roundedRect
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
