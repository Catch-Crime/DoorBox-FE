//
//  LoginViewController.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/27/25.
//

import Foundation
import UIKit
import Then
import KakaoSDKUser

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
        
        kakaoLogin() 
        
        if let sceneDelegate = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive })?.delegate as? SceneDelegate {
            let homeVC = HomeViewController()
            let nav = UINavigationController(rootViewController: homeVC)
            sceneDelegate.window?.rootViewController = nav
        }
    }
    
    func kakaoLogin() {
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 앱으로 로그인 인증
            kakaoLoginWithApp()
        } else { // 카톡이 설치가 안 되어 있을 때
            // 카카오 계정으로 로그인
            kakaoLoginWithAccount()
        }
    }
    
    func kakaoLoginWithApp() {
        UserApi.shared.loginWithKakaoTalk { (token, error) in
            if let error = error {
                print("카카오톡 로그인 실패: \(error)")
                return
            }
            print("카카오톡 로그인 성공")
        }
    }
    
    func kakaoLoginWithAccount() {
        UserApi.shared.loginWithKakaoAccount { (token, error) in
            if let error = error {
                print("카카오계정 로그인 실패: \(error)")
                return
            }
            
            print("카카오계정 로그인 성공")
        }
    }
}
