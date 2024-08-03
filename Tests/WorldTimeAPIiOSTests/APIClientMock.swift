//
//  APIClientMock.swift
//
//
//  Created by 竹ノ内愛斗 on 2024/08/03.
//

import Foundation
@testable import WorldTimeAPIiOS

final class APIClientMock: APIClient {

    var mockError: Error?
    var requestHandler: ((any APIRequest) throws -> Decodable)?

    func request<T>(_ entity: T) async throws -> T.ResponseEntity where T: APIRequest {
        if let error = mockError {
            throw error
        }
        return try requestHandler?(entity) as! T.ResponseEntity
    }
}
