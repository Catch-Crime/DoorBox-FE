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
    
    var selectedDateFromCalendar: String = ""
    var onDateSelected: ((String) -> Void)?
    
    private lazy var calendarView = CalendarView().then { view in
        view.backgroundColor = .white
        view.selectedButton.addTarget(self, action: #selector(selectedBtnTapped), for: .touchUpInside)
        
        view.onDateSelected = { [weak self] date in
            let formatter = DateFormatter()
            formatter.dateFormat = "MM / dd"
            self!.selectedDateFromCalendar = formatter.string(from: date)
            print("선택한 날짜: \(self!.selectedDateFromCalendar)")
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
        onDateSelected?(selectedDateFromCalendar)
        navigationController?.popViewController(animated: true)
    }
}
