//
//  MyPageView.swift
//  DoorBox-FE
//
//  Created by 김민지 on 8/4/25.
//

import Foundation
import UIKit
import SnapKit
import Then

class MyPageView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var navigationBar = NavigationBar() 
    
    lazy var topView = UIView()
    
    lazy var profileIamgeView = UIImageView().then { imageView in
        imageView.backgroundColor = .gray01
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
    }
    
    lazy var cameraButton = UIButton().then { button in
        button.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        button.tintColor = .blue02
    }
    
    lazy var nameLabel = UILabel().then { label in
        label.text = "도어박스"
        label.font = .body2
        label.textColor = .blue02
        label.textAlignment = .left
        label.numberOfLines = 1
    }
        
    lazy var alermLabel = UILabel().then { label in
        label.text = "카카오톡 알림 설정"
        label.textColor = .blue02
        label.font = .description
    }

    lazy var alermView = UIView().then { view in
        view.backgroundColor = .gray01
        view.layer.cornerRadius = 8
    }

    lazy var withdrawButton = UIButton().then { button in
        button.setTitle("탈퇴하기", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .body
    }
    
    lazy var logoutButton = UIButton().then { button in
        button.setTitle( "로그아웃", for: .normal)
        button.setTitleColor(.red01, for: .normal)
        button.titleLabel?.font = .body
        
    }
    
    
    func addComponents() {
        addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview()
        }
        
        addSubview(topView)
        topView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(130)
        }
        
        topView.addSubview(profileIamgeView)
        topView.addSubview(cameraButton)
        topView.addSubview(nameLabel)
        
        profileIamgeView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        cameraButton.snp.makeConstraints { make in
            make.leading.equalTo(profileIamgeView.snp.trailing).inset(40)
            make.top.equalTo(profileIamgeView.snp.bottom).inset(30)
            make.width.height.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(profileIamgeView.snp.trailing).offset(30)
        }
        
        addSubview(alermLabel)
        addSubview(alermView)
        
        alermLabel.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(60)
        }
        
        alermView.snp.makeConstraints { make in
            make.top.equalTo(alermLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(300)
        }
        
        addSubview(withdrawButton)
        addSubview(logoutButton)
        withdrawButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(100)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(100)
        }
        
        logoutButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(100)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(100)
        }
        
    }
}
