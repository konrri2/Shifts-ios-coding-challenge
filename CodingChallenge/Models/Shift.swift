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
        case start_time
        case end_time
        case normalized_start_date_time
        case normalized_end_date_time
        case timezone
        case premiumRate = "premium_rate"
        case covid
        case shiftKind = "shift_kind"
        case withinDistance = "within_distance"
        case facilityType = "facility_type"
        case skill
        case localizedSpecialty = "localized_specialty"
    }

    private(set) var shiftId: Int
    private var start_time: String
    private var end_time: String
    private var normalized_start_date_time: String
    private var normalized_end_date_time: String
    private(set) var timezone: String
    private(set) var premiumRate: Bool
    private(set) var covid: Bool
    private(set) var shiftKind: String
    private(set) var withinDistance: Int
    private(set) var facilityType: FacilityType
    private(set) var skill: Skill
    private(set) var localizedSpecialty: LocalizedSpecialty

    var startTime: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: start_time)
    }

    var endTime: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: end_time)
    }
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
