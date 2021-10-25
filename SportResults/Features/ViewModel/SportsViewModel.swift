//
//  SportsViewModel.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation
import Combine
 
class SportsViewModel: ObservableObject, SportsResultProtocol, Loadable {
 
  typealias Output = [String: [SportInfoProtocol]]
  @Published var state: LoadingState<Output> = .idle
  var apiSession: APISessionProtocol
  
  private var cancellables = Set<AnyCancellable>()
  
  init(apiSession: APISessionProtocol = APISession()) {
    self.apiSession = apiSession
    self.load()
  }
  
  func load() {
    self.state = .loading
    self.sportsResult()
      .receive(on: DispatchQueue.main)
      .sink { [weak self] result in
        if case .failure(let error) = result {
          self?.state = .failed(error)
        }
    } receiveValue: { bucket in
      let sortedData = bucket.sports.sorted(by: { $0.publicationDate.toLongDateFormat > $1.publicationDate.toLongDateFormat })
      let dictionaryByMonth = sortedData.group { $0.publicationDate.toLongDateFormat.toString(format: "MMM dd, yyyy") }
      self.state = .loaded(dictionaryByMonth)
    }.store(in: &cancellables)
  }
}
