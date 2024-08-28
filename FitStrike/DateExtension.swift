//
//  DateExtension.swift
//  FitStrike
//
//  Created by Enzo Lizama on 21/08/24.
//

import Foundation

extension Date {
    /// Format a date using the specified format.
    ///     - format: A date pattern string like "MM dd".
    func formatted(as format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    var yearMonthDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy MM dd"
        return dateFormatter.string(from: self)
    }

    /// Check another date is the same year, month and day.
    func isSameDay(as day: Date) -> Bool {
        return self.yearMonthDay == day.yearMonthDay
    }

    var dayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
