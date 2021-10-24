//
//  SportsBucket.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation

struct CustomCodingKeys: CodingKey {
  var stringValue: String
  init?(stringValue: String) {
    self.stringValue = stringValue
  }
  var intValue: Int?
  init?(intValue: Int) {
    return nil
  }
}

struct SportsBucket: Decodable {
  enum SportsType: String {
    case f1Results
    case nbaResults
    case Tennis
    case unknown
  }
  var sports = [SportInfoProtocol]()
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CustomCodingKeys.self)
    for key in container.allKeys.compactMap({ CustomCodingKeys(stringValue: $0.stringValue) }) {
      let sportsType = SportsType(rawValue: key.stringValue)
      switch sportsType {
      case .f1Results:
        self.sports.append(contentsOf: try container.decode([F1Result].self, forKey: key))
      case .nbaResults:
        self.sports.append(contentsOf: try container.decode([NbaResult].self, forKey: key))
      case .Tennis:
        self.sports.append(contentsOf: try container.decode([Tennis].self, forKey: key))
      case .unknown: break
      case .none:
        break
      }
    }
  }
}
