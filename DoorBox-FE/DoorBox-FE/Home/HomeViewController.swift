//
//  ViewController.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/25/25.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var homeView = HomeView().then { view in
        view.backgroundColor = .white
        
        view.photosTableView.delegate = self
        view.photosTableView.dataSource = self
        
        view.calendarButton.addTarget(self, action: #selector(calendarBtnTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
    }
    
    @objc private func calendarBtnTapped() {
        let calendarVC = CalendarViewController()
        self.navigationController?.pushViewController(calendarVC, animated: true)
    }
    


}

