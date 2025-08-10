//
//  PhotoDetailViewController.swift
//  DoorBox-FE
//
//  Created by 김민지 on 8/10/25.
//

import UIKit
import Then

class PhotoDetailViewController: UIViewController {

    private lazy var photoDetailView = PhotoDetailView().then { view in
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = photoDetailView
        setNavigationBarConstraints()
        
    }
    
    private func setNavigationBarConstraints() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let navi = photoDetailView.navigationBar
        navi.leftArrowButton.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
    }
    
    @objc private func backBtnTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}
