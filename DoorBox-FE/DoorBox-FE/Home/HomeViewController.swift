//
//  ViewController.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/25/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    let accessoryCount = 2               // 액세서리 셀 몇 개 보여줄지
    let items = HomeModel.dummy()        // 데이터는 한 번만 준비
    var selectedDate: Date = Date()   
    private let formatter = DateFormatter()
    
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
        
        // 오늘 날짜로 초기값 설정
        selectedDate = Date()
        updateDateUI()
        
        homeView.currentDateLabel.isHidden = false
        homeView.currentWeekdayLabel.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateDateUI()
    }
    
    @objc private func calendarBtnTapped() {
        let calendarVC = CalendarViewController()
        calendarVC.onDateSelected = { [weak self] date in
            guard let self = self else { return }
            // CalendarVC에서 넘어올 때 Date 타입으로 받도록 수정 추천
            self.selectedDate = date
            self.updateDateUI()
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
    
    private func updateDateUI() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM / dd"
        let dateString = dateFormatter.string(from: selectedDate)
        
        let weekdayFormatter = DateFormatter()
        weekdayFormatter.locale = Locale(identifier: "ko_KR") // 한국어 요일
        weekdayFormatter.dateFormat = "E"
        let weekdayString = weekdayFormatter.string(from: selectedDate)
        
        // 날짜 라벨 (항상 날짜 텍스트는 보여줌)
        homeView.dateLabel.text = dateString
        
        // 오늘인지 체크
        let calendar = Calendar.current
        if calendar.isDateInToday(selectedDate) {
            homeView.currentDateLabel.isHidden = false   // "오늘" 표시
            homeView.currentWeekdayLabel.isHidden = true
        } else {
            homeView.currentDateLabel.isHidden = true
            homeView.currentWeekdayLabel.isHidden = false
            homeView.currentWeekdayLabel.text = weekdayString
        }
        
        print("날짜: \(dateString), 요일: \(weekdayString)")
    }

    
    
    private func changeDate(by days: Int) {
        if let newDate = Calendar.current.date(byAdding: .day, value: days, to: selectedDate) {
            selectedDate = newDate
            updateDateUI()
        }
    }
    


}

