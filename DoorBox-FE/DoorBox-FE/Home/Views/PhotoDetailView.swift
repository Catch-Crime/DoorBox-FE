//
//  PhotoDetailView.swift
//  DoorBox-FE
//
//  Created by 김민지 on 8/10/25.
//

import UIKit
import SnapKit
import Then

class PhotoDetailView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var navigationBar = NavigationBar()

    lazy var photoView = UIImageView().then { imageView in
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "testImage")
    }
    
    private func addComponents() {
        self.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview()
        }
        
        addSubview(photoView)
        photoView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(500)
        }
    }
}
