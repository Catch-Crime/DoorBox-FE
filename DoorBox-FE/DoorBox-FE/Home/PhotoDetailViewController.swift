//
//  PhotoDetailViewController.swift
//  DoorBox-FE
//
//  Created by 김민지 on 8/10/25.
//

import UIKit
import Then

class PhotoDetailViewController: UIViewController, UIScrollViewDelegate {

    let photos: [String] = ["testImage", "testImage", "testImage"]
    
    private lazy var photoDetailView = PhotoDetailView().then { view in
        view.backgroundColor = .white
        view.photoScrollView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = photoDetailView
        setNavigationBarConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentScrollView()
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

extension PhotoDetailViewController {
    func contentScrollView() {

        for i in 0..<photos.count {
            let imageView = UIImageView(image: UIImage(named: photos[i]))
            let positionX = photoDetailView.photoScrollView.frame.width * CGFloat(i)

            imageView.frame = CGRect(
                   x: positionX,
                   y: 0,
                   width: photoDetailView.photoScrollView.frame.width,
                   height: photoDetailView.photoScrollView.frame.height
               )
            
            photoDetailView.photoScrollView.addSubview(imageView)
            
            photoDetailView.photoScrollView.contentSize = CGSize(
                width: photoDetailView.photoScrollView.frame.width * CGFloat(photos.count),
                height: photoDetailView.photoScrollView.frame.height
            )
            
            // 페이지 컨트롤 설정
            photoDetailView.photoPageControl.numberOfPages = photos.count
            photoDetailView.photoPageControl.currentPage = 0
        }
    }
    
    // 스크롤할 때 페이지 변경
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        photoDetailView.photoPageControl.currentPage = Int(pageIndex)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        photoDetailView.photoPageControl.isHidden = false
    }
}
