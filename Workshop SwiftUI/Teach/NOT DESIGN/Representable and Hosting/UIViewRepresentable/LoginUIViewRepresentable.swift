//
//  LoginUIViewRepresentable.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 9/11/22.
//

import SwiftUI

struct LoginUIViewRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = LoginViewController
    
    func makeUIViewController(context: Context) -> LoginViewController {
        let viewController = LoginViewController()
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {
        
    }
}
