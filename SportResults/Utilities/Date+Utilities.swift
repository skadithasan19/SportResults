//
//  Date+Utilities.swift
//  Bright
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation

extension String {
  var toDateFormat: Date {
    guard let date = Date(fromString: self, format: "MMM dd, yyyy hh:mm:ss a") else {
      return Date()
    }
    return date
  }
}

extension Date {
  
  // Initializes Date from string and format
  public init?(fromString string: String, format: String, identifier: String = Locale.current.identifier) {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    formatter.locale = Locale(identifier: identifier)
    if let date = formatter.date(from: string) {
      self = date
    } else {
      return nil
    }
  }
  
  // Converts Date to String, with format
  public func toString(format: String, identifier: String = Locale.current.identifier) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: identifier)
    formatter.dateFormat = format
    return formatter.string(from: self)
  }
}
