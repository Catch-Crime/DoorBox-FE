//
//  LoginView.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/27/25.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var appLogo = UIImageView().then { imageView in
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .blue01
    }
    
    lazy var kakaoLoginButton = UIButton().then { button in
        button.setTitle("카카오로 시작하기", for: .normal)
        button.setTitleColor(.blue02, for: .normal)
        button.backgroundColor = .kakao
        button.titleLabel?.font = .body2
        button.layer.cornerRadius = 20
        
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.imageView?.tintColor = .black
        button.imageView?.contentMode = .scaleAspectFit
        
        button.contentHorizontalAlignment = .center
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -130, bottom: 0, right: 0)
        
    }
    
    private func addComponents() {
        addSubview(appLogo)
        appLogo.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(183)
            make.height.width.equalTo(160)
        }
        
        
        addSubview(kakaoLoginButton)
        kakaoLoginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-168)
        }
    }
}
