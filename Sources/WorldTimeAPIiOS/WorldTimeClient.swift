// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

/// A client for fetching the current time from the WorldTimeAPI
public final class WorldTimeClient {

    private let apiClient: APIClient

    init(apiClient: APIClient = APIClientImpl()) {
        self.apiClient = apiClient
    }

    public init() {
        self.apiClient = APIClientImpl()
    }

    /// Fetch the current time with the given timezone
    /// - Parameters:
    ///  - timezone: The timezone to fetch the current time for
    /// - Returns: The current time with the given timezone
    public func fetchCurrentTime(with timezone: TimeZone) async throws -> CurrentTimeWithTimeZone {
        let request = WorldTimeAPIRequest.CurrentTimeWithTimeZoneRequest(timezone: timezone)
        return try await apiClient.request(request)
    }

    /// Fetch the current time with UTC timezone
    /// - Returns: The current time with UTC timezone TimeInterval
    public func fetchUTCDateTimeInterval() async throws -> TimeInterval? {
        let currentTime = try await fetchCurrentTime(with: .etc(.utc))
        return currentTime.datetime.toTimeInterval
    }

    /// Fetch the current time with UTC timezone
    /// - Returns: The current time with UTC timezone Date
    public func fetchUTCDateTime() async throws -> Date? {
        let currentTime = try await fetchCurrentTime(with: .etc(.utc))
        return currentTime.datetime.toDate
    }
}
