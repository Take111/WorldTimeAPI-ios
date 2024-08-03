//
//  String+Extension.swift
//
//
//  Created by 竹ノ内愛斗 on 2024/08/03.
//

import Foundation

extension String {
    var toTimeInterval: TimeInterval? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter.date(from: self)?.timeIntervalSince1970
    }

    var toDate: Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter.date(from: self)
    }
}
