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
    
    lazy var settingButton = UIButton().then { button in
        button.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        button.isUserInteractionEnabled = true
        button.tintColor = .blue02
    }
    
    lazy var middleView = UIView()
    
    lazy var leftArrorwButton = UIButton().then { button in
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.isUserInteractionEnabled = true
        button.tintColor = .blue02
    }
    
    lazy var rightArrowButton = UIButton().then { button in
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.isUserInteractionEnabled = true
        button.tintColor = .blue02
    }
    
    lazy var dateStackView = UIStackView().then { stack in
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .equalCentering
    }
    
    lazy var dateLabel = UILabel().then { label in
        label.text = "12 / 12"
        label.textColor = .blue02
        label.font = .headline
        label.textAlignment = .center
    }
    
    lazy var currentDateLabel = UILabel().then { label in
        label.text = "오늘"
        label.backgroundColor = .blue02
        label.font = .body2
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
    }
    
    lazy var middleLineView = UIView().then { view in
        view.backgroundColor = .blue02
    }
    
    lazy var photosTableView = UITableView().then { tableView in
        tableView.backgroundColor = .grey01
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.isScrollEnabled = true
    }
    
    
    private func addComponents() {
        addSubview(topView)
        topView.addSubview(profileButton)
        topView.addSubview(nicknameLabel)
        topView.addSubview(calendarButton)
        topView.addSubview(settingButton)
        
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
            make.trailing.equalTo(settingButton.snp.leading).offset(-10)
            make.width.height.equalTo(40)
            make.centerY.equalTo(profileButton)
        }
        
        settingButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.width.height.equalTo(40)
            make.centerY.equalTo(profileButton)
        }
        
        addSubview(middleView)
        middleView.addSubview(leftArrorwButton)
        middleView.addSubview(dateStackView)
        dateStackView.addArrangedSubview(dateLabel)
        dateStackView.addArrangedSubview(currentDateLabel)
        middleView.addSubview(rightArrowButton)
        
        middleView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
        leftArrorwButton.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        dateStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        currentDateLabel.snp.makeConstraints { make in
            make.width.equalTo(40)
        }
        
        rightArrowButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        addSubview(middleLineView)
        middleLineView.snp.makeConstraints { make in
            make.top.equalTo(middleView.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        addSubview(photosTableView)
        photosTableView.snp.makeConstraints { make in
            make.top.equalTo(middleLineView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview().inset(30)
        }
        
        
    }
    
    
}
