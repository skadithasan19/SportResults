//
//  SportsResultProtocol.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation
import Combine

protocol SportsResultProtocol {
  var apiSession: APISessionProtocol { get }
  func sportsResult() -> AnyPublisher<SportsBucket, APIError>
}

extension SportsResultProtocol {
  func sportsResult() -> AnyPublisher<SportsBucket, APIError> {
    return apiSession.request(with: SportsEndpoint.sportsResult)
  }
}
