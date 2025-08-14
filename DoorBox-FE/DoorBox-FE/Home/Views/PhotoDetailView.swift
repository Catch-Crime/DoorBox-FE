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

    lazy var warningLabel = UILabel().then { label in
        label.text = "위험 가능성이 감지되었습니다"
        label.textColor = .red
        label.textAlignment = .center
        label.font = .body
    }
    
    lazy var photoScrollView = UIScrollView().then { scrollView in
        scrollView.contentMode = .scaleAspectFill
        scrollView.layer.cornerRadius = 10
        scrollView.clipsToBounds = true
        scrollView.isPagingEnabled = true
    }
    
    lazy var photoPageControl = UIPageControl().then { control in
        control.backgroundColor = .clear
        control.pageIndicatorTintColor = .gray01
        control.currentPageIndicatorTintColor = .blue02
        control.currentPage = 0
        control.numberOfPages = 3
    }
    
    private func addComponents() {
        self.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview()
        }
        
        addSubview(warningLabel)
        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        addSubview(photoScrollView)
        photoScrollView.snp.makeConstraints { make in
            make.top.equalTo(warningLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(500)
        }
        
        addSubview(photoPageControl)
        photoPageControl.snp.makeConstraints { make in
            make.top.equalTo(photoScrollView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
    }
}
