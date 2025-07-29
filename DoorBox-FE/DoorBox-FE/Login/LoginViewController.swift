//
//  LoginViewController.swift
//  DoorBox-FE
//
//  Created by 김민지 on 7/27/25.
//

import Foundation
import UIKit
import Then

class LoginViewController: UIViewController {
    
    private lazy var loginView = LoginView().then { view in
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
}
