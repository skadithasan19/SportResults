//
//  SportsResultApp.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import SwiftUI

@main
struct SportResultsApp: App {
    var body: some Scene {
        WindowGroup {
          NavigationView {
            LandingPage()
          }
        }
    }
}

struct LandingPage: View {
  var body: some View {
    NavigationLink(destination: NavigationLazyView(ContentView())) {
      Text("Get Results")
        .font(.system(size: 14))
        .fontWeight(.medium)
        .padding()
        .background(Color.blue.opacity(0.68))
        .foregroundColor(.white)
    }.buttonStyle(PlainButtonStyle())
  }
}

struct LandingPage_Previews: PreviewProvider {
  static var previews: some View {
    LandingPage()
  }
}
