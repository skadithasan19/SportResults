//
//  Placeholder.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation

class Placeholder {
  static func sportsResults() -> [String: [SportInfoProtocol]] {
    guard let path = Bundle.main.path(forResource: "sampleResults", ofType: "json") else { preconditionFailure() }
    let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
    let sports = try! JSONDecoder().decode(SportsBucket.self, from: jsonData).sports
   return sports.group { $0.publicationDate.toLongDateFormat.toString(format: "MMM dd, yyyy") }
  }
}
