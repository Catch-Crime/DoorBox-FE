//
//  CalendarView.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/30/25.
//

import Foundation
import UIKit

class CalendarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var navigationBar = NavigationBar()

    
    
    private func addComponents() {
        self.addSubview(navigationBar)
        
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview()
        }
            
    }
}
