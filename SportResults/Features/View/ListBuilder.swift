//
//  ListBuilder.swift
//  SportResults
//
//  Created by Adit Hasan on 10/25/21.
//

import SwiftUI

struct ListBuilder: View {
  var sports: [SportInfoProtocol]?
  var body: some View {
    if let sports = sports {
      ForEach(sports.indices, id: \.self) { index in
        VStack(alignment: .leading, spacing: 10) {
          HStack {
            Text(sports[index].sportsType.sportName).font(.headline).fontWeight(.medium)
            Spacer()
            Text(sports[index].publicationDate.toLongDateFormat.toTimeFormat()).font(.footnote).fontWeight(.bold)
          }
          buildGameResultView(sport: sports[index])
        }.padding([.top, .bottom], 5)
      }
    } else {
      EmptyView()
    }
  }
}

fileprivate func buildGameResultView(sport: SportInfoProtocol) -> some View {
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
