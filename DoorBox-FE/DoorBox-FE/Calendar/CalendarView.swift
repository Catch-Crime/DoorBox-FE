//
//  CalendarView.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/30/25.
//

import Foundation
import UIKit
import FSCalendar
import SnapKit

class CalendarView: UIView, FSCalendarDelegate, FSCalendarDataSource {
    
    var markedDates: [Date] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        
        // 초기 선택을 오늘 날짜로
        DispatchQueue.main.async {
            self.calendarView.select(Date())
        }
        
        markedDates = [
            Date(),
            Calendar.current.date(byAdding: .day, value: 2, to: Date())!
        ]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var navigationBar = NavigationBar()

    lazy var calendarView = FSCalendar().then { calendar in
        calendar.delegate = self
        calendar.dataSource = self
        calendar.placeholderType = .none    // 이전, 이후 달 미리 표시
        calendar.locale = Locale(identifier: "ko_KR")

        calendar.appearance.selectionColor = .blue02
        calendar.appearance.titleDefaultColor = .blue02
        calendar.appearance.titleSelectionColor = .white
        
        // 오늘 날짜 설정
        calendar.appearance.todayColor = .gray01
        calendar.appearance.todaySelectionColor = .blue02
        calendar.appearance.titleTodayColor = .white
        calendar.appearance.titleFont = .body
        
        // weekday 설정
        calendar.appearance.weekdayTextColor = .blue02
        calendar.appearance.weekdayFont = .body2
        calendar.weekdayHeight = 50
        
        // header 설정
        calendar.appearance.headerTitleColor = .blue02
        calendar.appearance.headerTitleFont = .headline
        calendar.appearance.headerDateFormat = "YYYY. MM"
        calendar.headerHeight = 50
        
        // 이벤트 마커 표시
        calendar.appearance.eventDefaultColor = .red01
        calendar.appearance.eventSelectionColor = .white
        
        calendar.scope = .month
        calendar.setScope(.month, animated: false)
        
    }
    
    var calendarHeightConstraint: Constraint?
    
    //캘린더 height 맞추기
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint?.update(offset: bounds.height)

        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
    
    // 캘린더 표시할 날짜 체크
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
         return markedDates.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) }) ? 1 : 0
     }
    
    lazy var selectedButton = UIButton().then { button in
        button.setTitle("선택한 날짜로 이동", for: .normal)
        button.backgroundColor = .blue02
        button.tintColor = .white
        button.titleLabel?.font = .body2
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
    }
    
    private func addComponents() {
        self.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview()
        }
        
        addSubview(calendarView)
        calendarView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(15)
            calendarHeightConstraint = make.height.equalTo(370).constraint
        }
        
        addSubview(selectedButton)
        selectedButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(150)
            make.bottom.equalToSuperview().offset(-90)
        }
            
    }
}
