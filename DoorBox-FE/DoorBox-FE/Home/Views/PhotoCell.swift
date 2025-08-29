//
//  PhotosTableViewCell.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/28/25.
//

import UIKit
import SnapKit
import Then

class PhotoCell: UITableViewCell {
    
    static let identifier = "PhotoCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    lazy var photoImageView = UIImageView().then { imageView in
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "testImage")
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.borderWidth = 5
    }
    
    lazy var sirenImageView = UIImageView().then { imageView in
        imageView.image = UIImage(systemName: "light.beacon.max.fill")
        imageView.tintColor = .red
    }
    
    // 시간, 성별, 연령, 감정
    lazy var timeLabel = settitleLabel(title: "TIME")
    lazy var genderLabel = settitleLabel(title: "GENDER")
    lazy var ageLabel = settitleLabel(title: "AGE")
    lazy var emotionLabel = settitleLabel(title: "EMOTION")
    
    lazy var timeValeLabel = setValueLabel(title: "12:34:56")
    lazy var genderValueLabel = setValueLabel(title: "Male")
    lazy var ageValueLabel = setValueLabel(title: "25")
    lazy var emotionValueLabel = setValueLabel(title: "Anger")
    
    lazy var timeStackView = setStackView(spacing: 3)
    lazy var genderStackView = setStackView(spacing: 3)
    lazy var ageStackView = setStackView(spacing: 3)
    lazy var emotionStackView = setStackView(spacing: 3)
    
    lazy var infoView = UIView()
    
    lazy var underlineView = UIView().then { view in
        view.backgroundColor = .gray01
    }
    
    func settitleLabel(title: String) -> UILabel {
        return UILabel().then { label in
            label.text = title
            label.font = .description2
            label.textColor = .blue01
        }
    }
    
    func setValueLabel(title: String) -> UILabel {
        return UILabel().then { label in
            label.text = title
            label.font = .body
            label.textColor = .blue02
        }
    }
    
    func setStackView(spacing: CGFloat) -> UIStackView {
        return UIStackView().then { stack in
            stack.axis = .vertical
            stack.spacing = spacing
            stack.distribution = .fillEqually
        }
    }
    
    func addComponents() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.leading.equalToSuperview().inset(50)
            make.width.height.equalTo(100)
        }
        
        addSubview(sirenImageView)
        sirenImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(50)
            make.width.height.equalTo(25)
        }
        
        timeStackView.addArrangedSubview(timeLabel)
        timeStackView.addArrangedSubview(timeValeLabel)
        genderStackView.addArrangedSubview(genderLabel)
        genderStackView.addArrangedSubview(genderValueLabel)
        ageStackView.addArrangedSubview(ageLabel)
        ageStackView.addArrangedSubview(ageValueLabel)
        emotionStackView.addArrangedSubview(emotionLabel)
        emotionStackView.addArrangedSubview(emotionValueLabel)
        
        addSubview(infoView)
        infoView.addSubview(timeStackView)
        infoView.addSubview(genderStackView)
        infoView.addSubview(ageStackView)
        infoView.addSubview(emotionStackView)
        
        infoView.snp.makeConstraints { make in
            make.centerY.equalTo(photoImageView)
            make.leading.equalTo(photoImageView.snp.trailing).offset(20)
        }
        
        timeStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        genderStackView.snp.makeConstraints { make in
            make.top.equalTo(timeStackView.snp.bottom).offset(7)
            make.leading.equalToSuperview()
        }
        
        ageStackView.snp.makeConstraints { make in
            make.top.equalTo(genderStackView)
            make.leading.equalTo(genderStackView.snp.trailing).offset(20)
        }
        
        emotionStackView.snp.makeConstraints { make in
            make.top.equalTo(genderStackView)
            make.leading.equalTo(ageStackView.snp.trailing).offset(20)
            make.bottom.equalToSuperview()
        }
        
        addSubview(underlineView)
        underlineView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(1)
        }
    }
    
}
