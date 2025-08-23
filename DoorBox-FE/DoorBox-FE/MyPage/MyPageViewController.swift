//
//  MyPageViewController.swift
//  DoorBox-FE
//
//  Created by 김민지 on 8/4/25.
//

import Foundation
import UIKit
import Then

class MyPageViewController: UIViewController {
    
    private lazy var myPageView = MyPageView().then { view in
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = myPageView
        
        setNavigationBarConstraints()
    }
    
    private func setNavigationBarConstraints() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let navi = myPageView.navigationBar
        navi.configureTitle(title: "설정")
        navi.leftArrowButton.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
    }
    
    @objc private func backBtnTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}
