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
        view.kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginBtnTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
    
    @objc func kakaoLoginBtnTapped() {
        if let sceneDelegate = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive })?.delegate as? SceneDelegate {
            let homeVC = HomeViewController()
            let nav = UINavigationController(rootViewController: homeVC)
            sceneDelegate.window?.rootViewController = nav
        }
    }
}
