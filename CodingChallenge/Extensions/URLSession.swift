//
//  URLSession.swift
//  CodingChallenge
//
//  Created by Konrad Leszczyński on 22/09/2022.
//

import Foundation

extension URLSession {
    private static func httpError(_ statusCode: Int) -> NetworkRequestError {
        switch statusCode {
        case 400: return .badRequest
        case 401: return .unauthorized
        case 403: return .forbidden
        case 404: return .notFound
        case 402, 405...499: return .error4xx(statusCode)
        case 500: return .serverError
        case 501...599: return .error5xx(statusCode)
        default: return .unknownError
        }
    }

    func data(from request: URLRequest) async throws -> Data {
        guard #available(iOS 15, *) else {
            return try await dataiOS13(from: request)
        }

        let (data, response) = try await data(for: request)
        return try process(data: data, response: response)
    }

    @available(iOS, deprecated: 15.0, message: "Use the built-in API instead")
    private func dataiOS13(from request: URLRequest) async throws -> Data {
        try await withCheckedThrowingContinuation { continuation in
            let task = self.dataTask(with: request) { data, response, error in
                guard let data = data, let httpResponse: HTTPURLResponse = response as? HTTPURLResponse else {
                    let error: Error = error ?? URLError(.badServerResponse)
                    return continuation.resume(throwing: error)
                }

                if 200...299 ~= httpResponse.statusCode {
                    continuation.resume(returning: data)
                } else {
                    let url: String = httpResponse.url?.absoluteString ?? ""
                    print("🛑 Error processing response with statusCode: \(httpResponse.statusCode) for url: \(url)")
                    return continuation.resume(throwing: URLSession.httpError(httpResponse.statusCode))
                }
            }

            task.resume()
        }
    }

    private func process(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse: HTTPURLResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }

        if 200...299 ~= httpResponse.statusCode {
            return data
        } else {
            let url: String = httpResponse.url?.absoluteString ?? ""
            print("🛑 Error processing response with statusCode: \(httpResponse.statusCode) for url: \(url)")
            throw URLSession.httpError(httpResponse.statusCode)
        }
    }
}
