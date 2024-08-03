//
//  CurrentTimeWithTimeZone.swift
//
//
//  Created by 竹ノ内愛斗 on 2024/08/03.
//

import Foundation

public struct CurrentTimeWithTimeZone: Decodable {
    let abbreviation: String
    let clientIP: String
    let datetime: String
    let dayOfWeek: Int
    let dayOfYear: Int
    let dst: Bool
    let dstFrom: String?
    let dstOffset: Int
    let dstUntil: String?
    let rawOffset: Int
    let timezone: String
    let unixtime: Int
    let utcDatetime: String
    let utcOffset: String
    let weekNumber: Int

    enum CodingKeys: String, CodingKey {
        case abbreviation
        case clientIP = "client_ip"
        case datetime
        case dayOfWeek = "day_of_week"
        case dayOfYear = "day_of_year"
        case dst
        case dstFrom = "dst_from"
        case dstOffset = "dst_offset"
        case dstUntil = "dst_until"
        case rawOffset = "raw_offset"
        case timezone
        case unixtime
        case utcDatetime = "utc_datetime"
        case utcOffset = "utc_offset"
        case weekNumber = "week_number"
    }
}
