//
//  LoginService.swift
//  SecondSeminaStackView
//
//  Created by IJ . on 2019/11/02.
//  Copyright © 2019 jun. All rights reserved.
//

import Foundation
import Alamofire


class LoginService {
    
    static let shared = LoginService() //singleton 패턴 , 전역으로 접근가능 , 생애주기에서 한번만 생성
    
    private init() { }
    
                                            //파라미터로 body에 넘김. /completion closer부분 , completion 핸들러 ( 로그인 함수가 모두가 반환이되고,response가 서버로 반응이 온후에 , 탈출클로저 ,
    func login(_ id: String, _ pwd: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "id": id,
            "pwd": pwd
        ]
        
        //let loginUrl = "httfhf hjhgjjasjjj"
        Alamofire.request(APIConstants.LoginURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                //                print("request", response.request)
                //                print("response", response.response)
                //                print("data", response.data)
                //                print("result", response.result)
                
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
                                    let result = try decoder.decode(ResponseString.self, from: value)
                                    
                                    // ResponseString에 있는 success로 분기 처리
                                    switch result.success {
                                        
                                    case true:   //success가 true일때
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
                case .failure(let err): //err변수, 다양한 서버 err잡을려고
                    
                    print(err.localizedDescription)
                    completion(.networkFail)
                    // .networkFail이라는 반환 값이 넘어감
                    break
                } // response.result switch
        } // alamofire.request
    } // func login
} // struct



