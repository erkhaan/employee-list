//
//  DateFormatter+Ext.swift
//  employee-list
//
//  Created by Erkhaan  on 12.05.2024.
//

import Foundation

extension DateFormatter {
  static func formatDate(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    return dateFormatter.string(from: date)
  }
}
