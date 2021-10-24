//
//  Tennis.swift
//  SportResults
//
//  Created by Adit Hasan on 10/24/21.
//

import Foundation

// MARK: - Tennis
class Tennis: SportInfoProtocol {
  var publicationDate: String
  var tournament: String
  var winner: String
  let looser: String
  let numberOfSets: Int
  var sportsType: SportModel {
    .Tennis(self)
  }
}
