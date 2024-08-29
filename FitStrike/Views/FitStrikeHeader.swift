//
//  HeaderView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 20/08/24.
//

import SwiftUI

struct FitStrikeHeader: View {
    let titleText: String

    @Binding var selectedTab: Int

    var body: some View {
        VStack {
            Text(titleText)
                .font(.largeTitle)
            HStack {
                ForEach(Exercise.exercises.indices, id: \.self) { index in
                    let fill = index == selectedTab ? ".fill" : ""
                    Image(systemName: "\(index + 1).circle\(fill)").onTapGesture {
                        selectedTab = index
                    }
                }
            }
            .font(.title2)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FitStrikeHeader(titleText: "Squat", selectedTab: .constant(1))
}
