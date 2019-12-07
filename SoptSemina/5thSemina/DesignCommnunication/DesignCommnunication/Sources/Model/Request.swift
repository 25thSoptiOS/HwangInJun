//
//  Request.swift
//  DesignCommnunication
//
//  Created by IJ . on 2019/11/28.
//  Copyright © 2019 jun. All rights reserved.
//

struct InqueryReservationRequest {
    let way: Int
    let depart: String
    let arrive: String
    let date: String
    let people: Int
    let grade: Int
    
    var parameter: [String: Any] {
        return [
            "way": way,
            "depart": depart,
            "arrive": arrive,
            "date": date,
            "people": people,
            "grade": grade
        ]
    }
}
