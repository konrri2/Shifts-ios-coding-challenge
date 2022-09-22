//
//  ApiRequestConfiguration.swift
//  CodingChallenge
//
//  Created by Konrad Leszczyński on 22/09/2022.
//

import Foundation

/// TODO: for the real app make it dynamic not hardcoded
struct ApiRequestConfiguration {
    let baseUrl: URL = {
        guard let url = URL(string: "https://staging-app.shiftkey.com") else {
            fatalError("Cannot proceed without a proper url")
        }
        return url
    }()
    
    let path: String = "api/v2/available_shifts"
    
    let parameters: [String: String] = [
        "address": "Dallas, TX",
        "type": "list",
        "start": getFormatted(date: Date()),
        "end": getFormatted(date: Self.nextWeek)
    ]

    private static var nextWeek: Date = {
        return Date().addingTimeInterval(7 * 24 * 60 * 60)
    }()

    private static func getFormatted(date: Date) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        return dateFormat.string(from: date)
    }
}
