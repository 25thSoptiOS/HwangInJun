//
//  SignUpService.swift
//  SecondSeminaStackView
//
//  Created by IJ . on 2019/11/02.
//  Copyright © 2019 jun. All rights reserved.
//

import Foundation
import Alamofire

// 회원가입 메소드
//class SingUpService {
//
//    static let shared = SingUpService()
//    //singleton pattern
//    //생애 주기에서 딱 한번 객체가 생성되고 전역으로 접근이 가능
//
//
//    func signup(_ id : String, _ pwd : String, _ name : String, _ phone : String, completion : (NetworkResult<Any>) -> Void) {
//
//        let header : HTTPHeaders = [
//            "Content-Type" : "application/json"
//
//        ]
//
//        let body : Parameters = [
//            "id": id,
//            "pwd": pwd,
//            "name": name,
//            "phone": phone
//
//        ]
//
//        Alamofire.request(APIConstants.SignupURL, method: .post , parameters: body, encoding: JSONEncoding.default, headers: header).responseData{ response in
//
//            switch response.result {
//
//            case .success:
//
//                if let value = response.result.value {
//
//                    if let status = response.response?.statusCode {
//
//
//                        switch status {
//                        case 200:
//
//                            do let decoder = JSONDecoder()
//
//                            let result = try decoder.decode(ResponseDefault.self, from: value)
//                        case result.success:
//
//                        case result.failure:
//
//                        }
//
//                        case 400:
//                        completion(.pathErr)
//                        case 500:
//                        completion(.serverErr)
//
//                        default:
//                        break
//                    }
//                }
//
//            case .failure(let err):
//
//
//            }
//
//
//        }
//}
    

class SignUpService {
    
    static let shared = SignUpService()
    
    private init() {}
    
    func signUp(_ id: String, _ pwd: String, _ name: String, _ phone: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "id": id,
            "pwd": pwd,
            "name": name,
            "phone": phone
        ]
        
        Alamofire.request(APIConstants.SignupURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header).responseData {
            response in
            
            // parameter 위치
            switch response.result {
                
            // 통신 성공 - 네트워크 연결
            case .success:
                if let value = response.result.value {
                    
                    if let status = response.response?.statusCode {
                        switch status {
                        case 200:
                            do {
                                let decoder = JSONDecoder()
                                print("value", value)
                                let result = try decoder.decode(SignUpClass.self, from: value)
                                
                                // ResponseString에 있는 success로 분기 처리
                                switch result.success {
                                    
                                case true:
                                    print("success")
                                    completion(.success(result.data))
                                case false:
                                    completion(.requestErr(result.message))
                                }
                            }
                            catch {
                                completion(.pathErr)
                                print(error.localizedDescription)
                                print(APIConstants.LoginURL)
                            }
                        case 400:
                            completion(.pathErr)
                        case 500:
                            completion(.serverErr)
                        default:
                            break
                        }// switch
                    }// iflet
                }
                break
                
            // 통신 실패 - 네트워크 연결
            case .failure(let err):
                print(err.localizedDescription)
                completion(.networkFail)
                // .networkFail이라는 반환 값이 넘어감
                break
            } // response.result switch
        } // alamofire.request
    } // func login
} // struct
    
