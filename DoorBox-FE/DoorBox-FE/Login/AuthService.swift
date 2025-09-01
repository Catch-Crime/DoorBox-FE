//
//  LoginService.swift
//  DoorBox-FE
//
//  Created by 김민지 on 8/23/25.
//

import Foundation
import Alamofire
import KakaoSDKAuth

enum SocialType: String {
    case KAKAO
}

class AuthService {
    
    func login(idToken: String, social: SocialType, completion: @escaping (Result<Response<LoginResponse>, AFError>) -> Void
    ) {
        let endpoint = "/api/oauth2/login/kakao"
        let body = LoginRequest(idToken: idToken)
        
        APIClient.postRequest(endpoint: endpoint, parameters: body, completion: completion)
    }
}


