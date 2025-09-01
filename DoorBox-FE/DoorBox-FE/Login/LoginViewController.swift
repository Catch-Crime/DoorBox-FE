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
import KakaoSDKAuth


class LoginViewController: UIViewController {
    
    let authService = AuthService()
    
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
        UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
            print("=== loginWithKakaoTalk callback ===")
            debugPrint("oauthToken (raw): \(String(describing: oauthToken))")
            debugPrint("error: \(String(describing: error))")
            
            if let error = error {
                print("카카오톡 로그인 실패: \(error)")
            } else {
                self.handleKakaoOAuthToken(oauthToken)
            }
        }
    }
    
    func kakaoLoginWithAccount() {
         UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
             if let error = error {
                 print("카카오계정 로그인 실패: \(error)")
             } else {
                 print("카카오계정 로그인 성공")
                 self.handleKakaoOAuthToken(oauthToken)
             }
         }
     }
    
    private func handleKakaoOAuthToken(_ oauthToken: OAuthToken?) {
         guard let token = oauthToken else {
             print("oauthToken is nil -> return (SDK didn't map response).")
             return
         }
         
         print("token.accessToken: \(token.accessToken)")
         print("token.idToken: \(String(describing: token.idToken))")
         
         self.authService.login(idToken: token.idToken ?? "", social: .KAKAO) { [weak self] result in
             guard let self = self else { return }
             
             switch result {
             case .success(let response):
                 print("accessToken is\n \(response.result?.accessToken ?? "")")
                 print("refreshToken is\n \(response.result?.refreshToken ?? "")")
                 
                 if let sceneDelegate = UIApplication.shared.connectedScenes
                     .first(where: { $0.activationState == .foregroundActive })?.delegate as? SceneDelegate {
                     let homeVC = HomeViewController()
                     let nav = UINavigationController(rootViewController: homeVC)
                     sceneDelegate.window?.rootViewController = nav
                 }
                 
             case .failure(let error):
                 print("로그인 실패: \(error.localizedDescription)")
             }
         }
     }
}
