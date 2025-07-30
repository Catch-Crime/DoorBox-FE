//
//  LoginViewController.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/27/25.
//

import Foundation
import UIKit
import Then

class LoginViewController: UIViewController {
    
    private lazy var loginView = LoginView().then { view in
        view.backgroundColor = .white
        view.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    @objc func kakaoLoginButtonTapped() {
        let homeVC = HomeViewController()
        if let sceneDelegate = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive })?.delegate as? SceneDelegate {
            sceneDelegate.changeRootViewController(homeVC, animated: false)
        }
    }
}
