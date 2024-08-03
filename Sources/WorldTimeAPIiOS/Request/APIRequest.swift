//
//  APIRequest.swift
//
//
//  Created by 竹ノ内愛斗 on 2024/08/03.
//

import Foundation

protocol APIRequest {
    associatedtype ResponseEntity: Decodable

    var url: URL { get }
}

enum WorldTimeAPIRequest {

    static let baseURL = URL(string: "https://worldtimeapi.org/api")!

    struct CurrentTimeWithTimeZoneRequest: APIRequest {
        typealias ResponseEntity = CurrentTimeWithTimeZone

        let timezone: TimeZone

        var url: URL {
            baseURL.appendingPathComponent("timezone")
                .appendingPathComponent(timezone.stringValue)
        }
    }
}
