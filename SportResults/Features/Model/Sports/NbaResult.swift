//
//  NbaResult.swift
//  SportResults
//
//  Created by Adit Hasan on 10/24/21.
//

import Foundation

// MARK: - NbaResult
class NbaResult: SportInfoProtocol {
  var publicationDate: String
  var tournament: String
  var winner: String
  let gameNumber: Int
  let looser, mvp: String
  var sportsType: SportModel {
    .nbaResults(self)
  }
}
