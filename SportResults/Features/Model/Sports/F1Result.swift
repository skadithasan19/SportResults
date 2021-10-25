//
//  F1Result.swift
//  SportResults
//
//  Created by Adit Hasan on 10/24/21.
//

import Foundation

// MARK: - F1Result
class F1Result: SportInfoProtocol {
  var publicationDate: String
  var tournament: String
  var winner: String
  var seconds: Double
  var sportsType: SportModel {
    .f1Results(self)
  }
}
