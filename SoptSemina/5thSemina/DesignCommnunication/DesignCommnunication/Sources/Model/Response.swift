//
//  NewData.swift
//  DesignCommnunication
//
//  Created by IJ . on 2019/11/23.
//  Copyright © 2019 jun. All rights reserved.
//

import Foundation

struct ResponseTemplate<T: Decodable>: Decodable {
    let status: Int
    let success: Bool
    let message: String
    let data: T?
}

struct RegionResponse: Decodable {
    let sitIndex: Int
    let possible: Bool
    
    enum CodingKeys: String, CodingKey {
        case sitIndex = "sit_idx"
        case possible
    }
}



//struct NewData: Codable {
//    let status : Int
//    let success : Bool
//    let message : String
//    let data: [ContentData]
//    
//    struct ContentData: Codable {
//        
//        let sitIndex : Int
//        let possible : Bool
//        
//        enum CodingKeys: String, CodingKey {
//                   
//                   case sitIndex = "sit_idx"
//                   case possible
//                   
//                   
//               }
//    }
//}
//"""//(상태코드 200)
//{
//    """"status"""": 200,
//    """"success"""": true,
//    """"message"""": """"고속버스 조회 성공"""",
//    """"data"""": [
//        {
//            ""sit_idx"": 1,
//            ""possible"": true
//        },
//        {
//            ""sit_idx"": 2,
//            ""possible"": true
//        },
//        {
//            ""sit_idx"": 3,
//            ""possible"": true
//        },
//        ...
//        {
//            ""sit_idx"": 40,
//            ""possible"": true
//        }
//    ]
//}
//"
