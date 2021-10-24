//
//  SportInfoProtocol.swift
//  SportResults
//
//  Created by Adit Hasan on 10/24/21.
//

import Foundation

enum SportModel {
  case f1Results(F1Result)
  case nbaResults(NbaResult)
  case Tennis(Tennis)
  case unknown
}

protocol SportInfoProtocol: Codable, AnyObject {
  var sportsType: SportModel { get }
  var publicationDate: String { get set }
  var tournament: String { get set }
  var winner: String { get set }
}
