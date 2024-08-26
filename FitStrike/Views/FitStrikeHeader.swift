//
//  HeaderView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 20/08/24.
//

import SwiftUI

struct FitStrikeHeader: View {
    let exerciseName: String

    var body: some View {
        VStack {
            Text(exerciseName)
                .font(.largeTitle)
            HStack {
                Image(systemName: "1.circle")
                    .font(.largeTitle)
                Image(systemName: "2.circle")
                Image(systemName: "3.circle")
                Image(systemName: "4.circle")
            }
            .font(.title2)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    FitStrikeHeader(exerciseName: "Squat")
}
