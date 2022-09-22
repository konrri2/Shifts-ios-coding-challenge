//
//  ApiManager.swift
//  CodingChallenge
//
//  Created by Konrad Leszczyński on 22/09/2022.
//

import Foundation

struct ApiManager {

    public func fetchData() async throws -> ShiftsResponse? {
        let request = Self.buildRequest(for: ApiRequestConfiguration())
        let data = try await URLSession.shared.data(from: request)
        return try JSONDecoder().decode(ShiftsResponse.self, from: data)
    }

    private static func buildRequest(for config: ApiRequestConfiguration) -> URLRequest {
        /// URLComponents created from baseURL combined with path
        guard var components = URLComponents(url: config.baseUrl.appendingPathComponent(config.path), resolvingAgainstBaseURL: false) else {
            print("🛑 Unable to create URL")
            fatalError("Unable to create URL components")
        }

        /// Appending query items from parameters
        if !config.parameters.isEmpty {
            components.queryItems = config.parameters.map {
                URLQueryItem(name: String($0), value: String($1))
            }
        }

        guard let url = components.url else {
            print("🛑 Unable to get full URL for components: \(components)")
            fatalError("Could not get full URL for components: \(components)")
        }

        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"

        // TODO: make dynamic for multiple requests
        let defaultHeaders: [String: String] = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]

        defaultHeaders.forEach { header in
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }

        return request
    }
}

#if DEBUG
/// Only for testing
extension ApiManager {
    internal static func getDefaultRequest() -> URLRequest  {
        return buildRequest(for: ApiRequestConfiguration())
    }
}
#endif
