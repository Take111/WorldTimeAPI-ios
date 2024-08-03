//
//  APIClient.swift
//
//
//  Created by 竹ノ内愛斗 on 2024/08/03.
//

import Foundation


enum APIClientError: Error {
    case invalidURL
    case invalidResponse
}

protocol APIClient {
    func request<T>(_ entity: T) async throws -> T.ResponseEntity where T: APIRequest
}

final class APIClientImpl: APIClient {
    func request<T>(_ entity: T) async throws -> T.ResponseEntity where T: APIRequest {
        let url = entity.url
        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)

        guard let requestURL = components?.url else {
            throw APIClientError.invalidURL
        }

        let (data, urlResponse) = try await URLSession.shared.data(from: requestURL)
        guard let response = urlResponse as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIClientError.invalidResponse
        }
        return try JSONDecoder().decode(T.ResponseEntity.self, from: data)
    }
}
