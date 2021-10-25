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
          ListBuilder(sports: sports[month])
        }
      }
    }
    .navigationBarTitle(Text("Results"), displayMode: .automatic)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
