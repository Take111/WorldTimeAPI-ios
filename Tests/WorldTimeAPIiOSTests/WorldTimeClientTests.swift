//
//  WorldTimeClientTests.swift
//  
//
//  Created by 竹ノ内愛斗 on 2024/08/03.
//

import XCTest
@testable import WorldTimeAPIiOS

final class WorldTimeClientTests: XCTestCase {

    var apiClient: APIClientMock!
    var client: WorldTimeClient!

    enum Mock {
        static let timezoneResponse = CurrentTimeWithTimeZone(
            abbreviation: "UTC",
            clientIP: "127.0.0.1",
            datetime: "2024-08-03T12:34:56.789012+00:00",
            dayOfWeek: 6,
            dayOfYear: 216,
            dst: false,
            dstFrom: nil,
            dstOffset: 0,
            dstUntil: nil,
            rawOffset: 0,
            timezone: "Etc/UTC",
            unixtime: 1722795296,
            utcDatetime: "2024-08-03T12:34:56.789012+00:00",
            utcOffset: "+00:00",
            weekNumber: 31
        )
    }

    override func setUp() {
        super.setUp()

        apiClient = APIClientMock()
        client = WorldTimeClient(apiClient: apiClient)
    }

    func test_fetchCurrentTime_success() async throws {
        apiClient.requestHandler = { _ in
            Mock.timezoneResponse
        }
        let result = try await client.fetchCurrentTime(with: .etc(.utc))

        XCTAssertEqual(result.timezone, Mock.timezoneResponse.timezone)
        XCTAssertEqual(result.datetime, Mock.timezoneResponse.datetime)
    }

    func test_fetchCurrentTime_failure() async {
        apiClient.mockError = APIClientError.invalidResponse

        do {
            _ = try await client.fetchCurrentTime(with: .etc(.utc))
            XCTFail("Expected an error to be thrown")
        } catch {
            XCTAssertEqual(error as? APIClientError, APIClientError.invalidResponse)
        }
    }

    func test_fetchUTCDateTimeInterval() async throws {
        apiClient.requestHandler = { _ in
            Mock.timezoneResponse
        }
        let result = try await client.fetchUTCDateTimeInterval()

        XCTAssertEqual(result, Mock.timezoneResponse.datetime.toTimeInterval)
    }

    func test_fetchUTCDateTimeInterval_failure() async {
        apiClient.mockError = APIClientError.invalidResponse

        do {
            _ = try await client.fetchUTCDateTimeInterval()
            XCTFail("Expected an error to be thrown")
        } catch {
            XCTAssertEqual(error as? APIClientError, APIClientError.invalidResponse)
        }
    }

    func test_fetchUTCDateTime() async throws {
        apiClient.requestHandler = { _ in
            Mock.timezoneResponse
        }
        let result = try await client.fetchUTCDateTime()

        XCTAssertEqual(result, Mock.timezoneResponse.datetime.toDate)
    }

    func test_fetchUTCDateTime_failure() async {
        apiClient.mockError = APIClientError.invalidResponse

        do {
            _ = try await client.fetchUTCDateTime()
            XCTFail("Expected an error to be thrown")
        } catch {
            XCTAssertEqual(error as? APIClientError, APIClientError.invalidResponse)
        }
    }
}
