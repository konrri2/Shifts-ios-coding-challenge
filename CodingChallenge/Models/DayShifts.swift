//
//  DayShifts.swift
//  CodingChallenge
//
//  Created by Konrad Leszczyński on 22/09/2022.
//

import Foundation

struct DayShifts: Decodable {
    var date: String?
    var shifts: [Shift]
}
