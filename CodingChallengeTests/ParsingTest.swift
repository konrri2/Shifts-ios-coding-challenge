//
//  ParsingTest.swift
//  CodingChallengeTests
//
//  Created by Konrad Leszczyński on 22/09/2022.
//

import XCTest
@testable import CodingChallenge

class ParsingTest: XCTestCase {

    func test_parsing_exampleResponse() {
        let response = ShiftsResponse.makeTestInstance()
        XCTAssertEqual(response.data.count, 1)

        guard let day = response.data.first else {
            XCTFail("empty array of days")
            return
        }

        XCTAssertEqual(day.date, "2022-09-23")
    }

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

    func test_parsingResponse_with_singleDay_singleShift() {
        let json = """
{
    "data": [
        {
            "date": "2022-09-23",
            "shifts": [
                {
                    "shift_id": 3823946,
                    "start_time": "2022-09-23T11:00:00+00:00",
                    "end_time": "2022-09-23T23:00:00+00:00",
                    "normalized_start_date_time": "2022-09-23 06:00:00",
                    "normalized_end_date_time": "2022-09-23 18:00:00",
                    "timezone": "Central",
                    "premium_rate": false,
                    "covid": false,
                    "shift_kind": "Day Shift",
                    "within_distance": 80,
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
                },
            ]
        }
    ]
}
"""

        let data = Data(json.utf8)
        guard let response = try? JSONDecoder().decode(ShiftsResponse.self, from: data) else {
            XCTFail("Could not parse example json")
            return
        }
        XCTAssertEqual(response.data.count, 1)

        guard let day = response.data.first else {
            XCTFail("empty array of days")
            return
        }

        XCTAssertEqual(day.date, "2022-09-23")
    }
}
