//
//  Response.swift
//  DoorBox-FE
//
//  Created by 김민지 on 8/23/25.
//

import Foundation

struct Response<T: Codable> : Codable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: T?
}

struct EmptyResult: Codable {}
