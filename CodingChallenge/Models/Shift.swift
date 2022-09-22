//
//  Shift.swift
//  CodingChallenge
//
//  Created by Konrad Leszczyński on 22/09/2022.
//

import Foundation

struct Shift: Decodable {
    enum CodingKeys: String, CodingKey {
        case shiftId = "shift_id"
        case startTime = "start_time"
        case endTime = "end_time"
    }

    var shiftId: Int
    var startTime: String?
    var endTime: String?
}
