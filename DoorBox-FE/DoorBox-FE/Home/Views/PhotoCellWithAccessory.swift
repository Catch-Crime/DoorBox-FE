//
//  PhotoCellWithAccessory.swift
//  DoorBox-FE
//
//  Created by 김민지 on 8/2/25.
//

import UIKit
import SnapKit
import Then

class PhotoCellWithAccessory: UITableViewCell {
    
    static let identifier = "PhotoCellWithAccessory"

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
        imageView.layer.borderColor = UIColor.yellow01.cgColor
        imageView.layer.borderWidth = 5
    }
    
    lazy var warningImageView = UIImageView().then { imageView in
        imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(paletteColors: [.blue02, .yellow01])
        imageView.image = UIImage(systemName: "exclamationmark.triangle.fill")
        imageView.tintColor = .blue02
        // imageView.image = UIImage(named: "warning")
    }
    
    // 시간, 성별, 연령, 감정
    lazy var timeLabel = settitleLabel(title: "TIME")
    lazy var timeValeLabel = setValueLabel(title: "12:34:56")
    lazy var timeStackView = setStackView(spacing: 3)
    
    lazy var accessoryLabel = UILabel().then { label in
        label.text = "Accessory detected"
        label.font = .body2
        label.textColor = .blue01
    }
    
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
        
        addSubview(warningImageView)
        warningImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(50)
            make.width.height.equalTo(25)
        }
        
        timeStackView.addArrangedSubview(timeLabel)
        timeStackView.addArrangedSubview(timeValeLabel)
        
        addSubview(infoView)
        infoView.addSubview(timeStackView)
        infoView.addSubview(accessoryLabel)
        
        infoView.snp.makeConstraints { make in
            make.centerY.equalTo(photoImageView)
            make.leading.equalTo(photoImageView.snp.trailing).offset(20)
        }
        
        timeStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        accessoryLabel.snp.makeConstraints { make in
            make.top.equalTo(timeStackView.snp.bottom).offset(7)
            make.leading.equalToSuperview()
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
