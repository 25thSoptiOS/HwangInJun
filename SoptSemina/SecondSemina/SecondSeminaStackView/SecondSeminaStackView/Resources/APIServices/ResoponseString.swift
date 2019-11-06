//
//  ResoponseString.swift
//  SecondSeminaStackView
//
//  Created by IJ . on 2019/11/02.
//  Copyright © 2019 jun. All rights reserved.
//




import Foundation
//데이터프로토콜 , 구조체 , URL 경로 , 네이밍 체크해서 어디가 잘못됬나 확인
// MARK: - ResponseString
// 성공했을 때 response body
struct ResponseString: Codable {
    let success: Bool
    let message: String
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let userIdx: Int
    let id, password, name, phone: String
}

struct SignUpClass: Codable {
    let success: Bool
    let message: String
    let data: Int?
}
