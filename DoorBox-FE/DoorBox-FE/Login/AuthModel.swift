//
//  Untitled.swift
//  DoorBox-FE
//
//  Created by 김민지 on 8/23/25.
//

import Foundation

struct LoginRequest: Codable {
    let idToken: String
}

struct LoginResponse: Codable {
    let accessToken: String
    let refreshToken: String 
}
