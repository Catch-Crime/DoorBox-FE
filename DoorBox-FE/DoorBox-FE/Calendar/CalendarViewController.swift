//
//  CalendarViewController.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/30/25.
//

import Foundation
import UIKit
import Then
import FSCalendar

class CalendarViewController: UIViewController {
    
    var selectedDate: Date = Date()
    var onDateSelected: ((Date) -> Void)?
    
    private lazy var calendarView = CalendarView().then { view in
        view.backgroundColor = .white
        view.selectedButton.addTarget(self, action: #selector(selectedBtnTapped), for: .touchUpInside)
        
        view.onDateSelected = { [weak self] date in
            self?.selectedDate = date
            print("선택한 날짜: \(date)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = calendarView
        
        setNavigationBarConstraints()
    }
    
    private func setNavigationBarConstraints() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        let navi = calendarView.navigationBar
        navi.configureTitle(title: "캘린더")
        navi.leftArrowButton.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
    }
    
    @objc private func backBtnTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func selectedBtnTapped() {
        onDateSelected?(selectedDate) 
        navigationController?.popViewController(animated: true)
    }
}
