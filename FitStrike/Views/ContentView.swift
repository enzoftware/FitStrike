//
//  ContentView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 19/08/24.
//

import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedTab") private var selectedTab = 9

    var body: some View {
        TabView(selection: $selectedTab) {
            WelcomeView(selectedTab: $selectedTab).tag(9)
            ForEach(Exercise.exercises.indices, id: \.self) { index in
                ExerciseView(index: index, selectedTab: $selectedTab).tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

#Preview {
    ContentView()
}
