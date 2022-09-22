//
//  ShiftModelTests.swift
//  CodingChallengeTests
//
//  Created by Konrad Leszczyński on 22/09/2022.
//

import Foundation

import XCTest
@testable import CodingChallenge

class ShiftModelTests: XCTestCase {

    func test_parsing_exampleShift() {
        let shift = Shift.makeTestInstance()
        XCTAssertEqual(shift.shiftId, 4075185)

        XCTAssertNotNil(shift.startTime)
        XCTAssertNotNil(shift.endTime)

        XCTAssertEqual(shift.shiftKind, "Night Shift")
        XCTAssertEqual(shift.withinDistance, 20)
        XCTAssertFalse(shift.premiumRate)
        XCTAssertFalse(shift.covid)

        XCTAssertEqual(shift.facilityType.name, "Skilled Nursing Facility")
        XCTAssertEqual(shift.skill.name, "Long Term Care")
        XCTAssertEqual(shift.localizedSpecialty.name, "Certified Nursing Aide")
    }
}
