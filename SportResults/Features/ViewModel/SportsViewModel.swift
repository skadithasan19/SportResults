//
//  SportsViewModel.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation
import Combine
 
class SportsViewModel: ObservableObject, SportsResultProtocol, Loadable {
 
  typealias Output = [SportInfoProtocol]
  
  @Published var state: LoadingState<Output> = .idle
  
  var loadingOutput: Output = Placeholder.sportsResults()

  var apiSession: APISessionProtocol
  
  private var cancellables = Set<AnyCancellable>()
  
  init(apiSession: APISessionProtocol = APISession()) {
    self.apiSession = apiSession
    self.load() 
  }
  
  func load() {
    self.state = .loading(loadingOutput)
    self.sportsResult()
      .sink { [weak self] result in
        if case .failure(let error) = result {
          self?.state = .failed(error)
        }
    } receiveValue: { bucket in
      let sortedData = bucket.sports.sorted(by: { $0.publicationDate.toDateFormat > $1.publicationDate.toDateFormat })
      self.state = .loaded(sortedData)
    }.store(in: &cancellables)
  }
}
