//
//  ViewController.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/25/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    var selectedDateFromCalendar: String = ""
    
    private lazy var homeView = HomeView().then { view in
        view.backgroundColor = .white
        
        view.photosTableView.delegate = self
        view.photosTableView.dataSource = self
        
        view.calendarButton.addTarget(self, action: #selector(calendarBtnTapped), for: .touchUpInside)
        view.settingButton.addTarget(self, action: #selector(settingBtnTapped), for: .touchUpInside)
        view.leftArrorwButton.addTarget(self, action: #selector(leftArrowBtnTapped), for: .touchUpInside)
        view.rightArrowButton.addTarget(self, action: #selector(rightArrowBtnTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("\(selectedDateFromCalendar)")
        homeView.dateLabel.text = selectedDateFromCalendar
    }
    
    @objc private func calendarBtnTapped() {
        let calendarVC = CalendarViewController()
        calendarVC.onDateSelected = { [weak self] date in
            self?.selectedDateFromCalendar = date
        }
        self.navigationController?.pushViewController(calendarVC, animated: true)
    }
    
    @objc private func settingBtnTapped() {
        let myPageVC = MyPageViewController()
        self.navigationController?.pushViewController(myPageVC, animated: true)
    }
    
    @objc private func leftArrowBtnTapped() {
        changeDate(by: -1) // 하루 전
    }
    
    @objc private func rightArrowBtnTapped() {
        changeDate(by: 1) // 하루 후

    }
    
    private func changeDate(by days: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM / dd"
        
        // String -> Date 변환
        guard let currentDate = formatter.date(from: selectedDateFromCalendar) else {
            print("❌ 현재 날짜 변환 실패")
            return
        }
        
        // 날짜 계산
        if let newDate = Calendar.current.date(byAdding: .day, value: days, to: currentDate) {
            let newDateString = formatter.string(from: newDate)
            selectedDateFromCalendar = newDateString
            homeView.dateLabel.text = newDateString
            print("✅ 변경된 날짜: \(newDateString)")
        }
    }
    


}

