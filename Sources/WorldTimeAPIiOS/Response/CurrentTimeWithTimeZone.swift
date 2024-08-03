//
//  CurrentTimeWithTimeZone.swift
//
//
//  Created by 竹ノ内愛斗 on 2024/08/03.
//

import Foundation

public struct CurrentTimeWithTimeZone: Decodable {
    /// the abbreviated name of the timezone
    public let abbreviation: String
    /// the IP of the client making the request
    public let clientIP: String
    /// an ISO8601-valid string representing the current, local date/time
    public let datetime: String
    /// current day number of the week, where sunday is 0
    public let dayOfWeek: Int
    /// ordinal date of the current year
    public let dayOfYear: Int
    /// flag indicating whether the local time is in daylight savings
    public let dst: Bool
    /// an ISO8601-valid string representing the datetime when daylight savings started for this timezone
    public let dstFrom: String?
    /// the difference in seconds between the current local time and daylight saving time for the location
    public let dstOffset: Int
    /// an ISO8601-valid string representing the datetime when daylight savings will end for this timezone
    public let dstUntil: String?
    /// the difference in seconds between the current local time and the time in UTC, excluding any daylight saving difference (see dst_offset)
    public let rawOffset: Int
    /// timezone in Area/Location or Area/Location/Region format
    public let timezone: String
    /// number of seconds since the Epoch
    public let unixtime: Int
    /// an ISO8601-valid string representing the current date/time in UTC
    public let utcDatetime: String
    /// an ISO8601-valid string representing the offset from UTC
    public let utcOffset: String
    /// the current week number
    public let weekNumber: Int

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
