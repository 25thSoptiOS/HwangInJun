//
//  DataPost.swift
//  DesignCommnunication
//
//  Created by IJ . on 2019/11/23.
//  Copyright © 2019 jun. All rights reserved.
//

import Foundation
import Alamofire


class DataPost {
    
    private init() {}
    
    static let shared = DataPost() //싱글턴
    
    func postDataList(with inqueryReservationRequest: InqueryReservationRequest,
                      completion: @escaping (Swift.Result<ResponseTemplate<RegionResponse>, Error>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body = inqueryReservationRequest.parameter
        
         // 안전하지 않는 방법 let url = BaseURL.reserveURL+"?a="+a+"&b=\()"
        
        
        
//        way    편도/왕복    String
//        depart    출발    String
//        arrive    도착    String
//        date    가는 날    DATE
//        people    인원 수    Integer
//        class    등급    Integer
    
        
        let url = BaseURL.reserveURL
        
        
        Alamofire.request(url, method: .get, parameters: body, encoding: URLEncoding.default, headers: header)
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
                                    let result = try decoder.decode(ResponseTemplate<RegionResponse>.self, from: value)
                                    
                                    // newurl 서버에서 통신 결과 값만 디코딩하면 되므로 기존의 구조체가 아닌 NewData구조체로 디코딩
                                    
                                
                                    if result.status == 200 {
                                        print("success")
                                        completion(.success(result))
                                
                                        
                                    } else {
                                        fatalError("서버 이상")
                                        completion(.failure(fatalError("서버이상")))
                                    }
                                } catch {
                                    print(error.localizedDescription)
                                    completion(.failure(error))
                                }
                     
                            default:
                                break
                            }// switch
                        }// iflet
                    }
                    break
                // 통신 실패 - 네트워크 연결
                case let .failure(error): //err변수, 다양한 서버 err잡을려고
                    
                    print(error.localizedDescription)
                    print("DataPost 통신 실패")
                    // .networkFail이라는 반환 값이 넘어감
                    break
                } // response.result switch
        } // alamofire.request
        
        
        
    }
    
    
    
    
    
    
}
