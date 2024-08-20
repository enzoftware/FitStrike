//
//  ExerciseView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 20/08/24.
//

import SwiftUI

let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]


struct ExerciseView: View {
    let index: Int

    var body: some View {
        Text(exerciseNames[index])
    }
}

#Preview {
    ExerciseView(index: 0)
}
