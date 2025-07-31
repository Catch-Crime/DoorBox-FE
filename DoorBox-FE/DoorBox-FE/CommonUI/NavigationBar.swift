//
//  NavigationBar.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/30/25.
//

import UIKit
import Then
import SnapKit

class NavigationBar: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var leftArrowButton = UIButton().then { button in
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.isUserInteractionEnabled = true
        button.tintColor = .blue02
    }
    
    private lazy var maintitleLabel = UILabel().then { label in
        label.textColor = .blue02
        label.font = .headline
    }

    
    private func addComponents() {
        self.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
        
        self.addSubview(leftArrowButton)
        self.addSubview(maintitleLabel)
        
        maintitleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
        
        leftArrowButton.snp.makeConstraints { make in
            make.centerY.equalTo(maintitleLabel)
            make.leading.equalToSuperview().offset(30)
            make.height.width.equalTo(40)
        }
        
        leftArrowButton.imageView?.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(12)
        }
    }
    
    public func configureTitle(title: String) {
        maintitleLabel.text = title
    }
    

}

