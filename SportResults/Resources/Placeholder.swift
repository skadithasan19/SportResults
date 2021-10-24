//
//  Placeholder.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation

class Placeholder {
  static func sportsResults() -> [SportInfoProtocol] {
    guard let path = Bundle.main.path(forResource: "sampleResults", ofType: "json") else { preconditionFailure() }
    let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path))
    return try! JSONDecoder().decode(SportsBucket.self, from: jsonData).sports
  }
}
