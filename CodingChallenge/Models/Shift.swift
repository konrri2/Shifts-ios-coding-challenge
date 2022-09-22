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


#if DEBUG
/// Only for testing and preview
extension Shift {
    internal static func makeTestInstance() -> Shift {
        let json = """
{
                    "shift_id": 4075185,
                    "start_time": "2022-09-24T04:00:00+00:00",
                    "end_time": "2022-09-24T12:00:00+00:00",
                    "normalized_start_date_time": "2022-09-23 23:00:00",
                    "normalized_end_date_time": "2022-09-24 07:00:00",
                    "timezone": "Central",
                    "premium_rate": false,
                    "covid": false,
                    "shift_kind": "Night Shift",
                    "within_distance": 20,
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
        let data = Data(json.utf8)
        guard let shift = try? JSONDecoder().decode(Shift.self, from: data) else {
            print("🛑 Could not parse example json")
            fatalError()
        }

        return shift
    }
}
#endif
