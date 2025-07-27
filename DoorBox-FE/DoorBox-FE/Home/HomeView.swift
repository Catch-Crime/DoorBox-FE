//
//  HomeView.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/26/25.
//

import Foundation
import UIKit
import Then
import SnapKit

class HomeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var topView = UIView()
    
    lazy var profileButton = UIButton().then { button in
        button.setImage(UIImage(named: "profile"), for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        
        button.imageView?.contentMode = .scaleAspectFill
        button.imageView?.clipsToBounds = true
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.isUserInteractionEnabled = true
    }
    
    lazy var nicknameLabel = UILabel().then { label in
        label.text = "도어박스 님"
        label.font = .headline
        label.textColor = .blue02
        label.textAlignment = .left
        label.numberOfLines = 1
    }
    
    lazy var calendarButton = UIButton().then { button in
        button.setImage(UIImage(named: "calendar"), for: .normal)
        button.isUserInteractionEnabled = true
    }
    
    private func addComponents() {
        addSubview(topView)
        topView.addSubview(profileButton)
        topView.addSubview(nicknameLabel)
        topView.addSubview(calendarButton)
        
        topView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(90)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
        
        profileButton.snp.makeConstraints { make in
            make.top.leading.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        
        nicknameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileButton)
            make.leading.equalTo(profileButton.snp.trailing).offset(18)
        }
        
        calendarButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.width.height.equalTo(50)
            make.centerY.equalTo(profileButton)
        }
    }
    
    
}
