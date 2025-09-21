//
//  HomeModel.swift
//  DoorBox-FE
//
//  Created by 김민지 on 9/2/25.
//

import UIKit

struct HomeModel {
    let image: UIImage
    let age: String
    let gender: String
    let emotion: String
}

extension HomeModel {
    static func dummy() -> [HomeModel] {
        return [
            HomeModel(image: .test, age: "30s", gender: "Male", emotion: "Anger"),
            HomeModel(image: .testImage2, age: "20s", gender: "Male", emotion: "Neutral"),
            HomeModel(image: .testImage3, age: "20s", gender: "Female", emotion: "Neutral"),
            HomeModel(image: .testImage2, age: "20s", gender: "Male", emotion: "Neutral")
        ]
    }
}
