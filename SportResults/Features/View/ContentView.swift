//
//  ContentView.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var viewModel = SportsViewModel()
  var body: some View {
    AsyncLoadableView(source: viewModel) { sports in
      List(Array(sports.keys.sorted(by: { $0.toShortDateFormat > $1.toShortDateFormat })), id: \.self) { month in
        Section(header: Text(month)) {
          self.ListBuilders(sports: sports[month] ?? [])
        }
      }
    }
    .navigationBarTitle(Text("Results"), displayMode: .automatic)
  }
  
  func ListBuilders(sports: [SportInfoProtocol]) -> some View{
    ForEach(sports.indices, id: \.self) { index in
      VStack(alignment: .leading, spacing: 4) {
        Text(sports[index].publicationDate.toLongDateFormat.toTimeFormat()).font(.headline)
        buildGameResultView(sport: sports[index])
      }.padding([.top, .bottom], 5)
    }
  }
}

func buildGameResultView(sport: SportInfoProtocol) -> some View {
  switch sport.sportsType {
  case .f1Results(let result):
    return AnyView(Text("\(result.winner) wins \(result.tournament) by \( String(format: "%0.3f", result.seconds)) seconds"))
  case .nbaResults(let result):
    return AnyView(Text("\(result.mvp) leads \(result.winner) to game \(result.gameNumber) win in the \(result.tournament)"))
  case .Tennis(let result):
    return AnyView(Text("\(result.tournament): \(result.winner) wins against \(result.looser) in \(result.numberOfSets) sets"))
  case .unknown:
    return AnyView(EmptyView())
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
