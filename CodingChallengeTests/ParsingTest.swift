//
//  ParsingTest.swift
//  CodingChallengeTests
//
//  Created by Konrad Leszczyński on 22/09/2022.
//

import XCTest
@testable import CodingChallenge

class ParsingTest: XCTestCase {

    func test_parsingShift() {
        let exampleShiftJson = """
{
                    "shift_id": 3850655,
                    "start_time": "2022-09-23T11:00:00+00:00",
                    "end_time": "2022-09-23T19:00:00+00:00",
                    "normalized_start_date_time": "2022-09-23 06:00:00",
                    "normalized_end_date_time": "2022-09-23 14:00:00",
                    "timezone": "Central",
                    "premium_rate": false,
                    "covid": false,
                    "shift_kind": "Day Shift",
                    "within_distance": 130,
                    "facility_type": {
                        "id": 8,
                        "name": "Skilled Nursing Facility",
                        "color": "#AF52DE"
                    },
                    "skill": {
                        "id": 2,
                        "name": "Long Term Care",
                        "color": "#007AFF"
                    },
                    "localized_specialty": {
                        "id": 44,
                        "specialty_id": 6,
                        "state_id": 44,
                        "name": "Certified Nursing Aide",
                        "abbreviation": "CNA",
                        "specialty": {
                            "id": 6,
                            "name": "Certified Nursing Aide",
                            "color": "#007AFF",
                            "abbreviation": "CNA"
                        }
                    }
                }
"""

        let data = Data(exampleShiftJson.utf8)
        guard let resultShift = try? JSONDecoder().decode(Shift.self, from: data) else {
            XCTFail("Could not parse example shift")
            return
        }
        XCTAssertEqual(resultShift.shiftId, 3850655)
    }

}
