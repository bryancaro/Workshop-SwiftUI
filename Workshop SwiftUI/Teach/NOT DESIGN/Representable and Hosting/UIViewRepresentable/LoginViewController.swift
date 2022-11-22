//
//  LoginViewController.swift
//  Workshop SwiftUI
//
//  Created by Bryan Caro on 9/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    //  MARK: - Local Components
    private let LogoComponent: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "O2O Logo")
        return image
    }()
    
    private let InfoLabelComponent: UILabel = {
        let infoNumber = UILabel()
        infoNumber.font = UIFont.boldSystemFont(ofSize: 22)
        infoNumber.textColor = .black
        infoNumber.text = "This is a UIViewController"
        
        return infoNumber
    }()
    
    //  MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //  MARK: - Configure UI
    func configureUI() {
        view.addSubview(LogoComponent)
        LogoComponent.centerX(inView: view)
        LogoComponent.anchor(top: view.topAnchor, paddingTop: 0, width: 200, height: 200)
        LogoComponent.addShadow()
        
        view.addSubview(InfoLabelComponent)
        InfoLabelComponent.centerX(inView: view)
        InfoLabelComponent.anchor(top: LogoComponent.bottomAnchor, paddingTop: 30)
    }
}
