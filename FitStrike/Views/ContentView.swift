//
//  ContentView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 19/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeView()
            ForEach(0 ..< 4) { index in
                ExerciseView(index: index)
            }
            Text("Welcome 2")
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
