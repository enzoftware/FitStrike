//
//  ExerciseView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 20/08/24.
//

import AVKit
import SwiftUI

struct ExerciseView: View {
    let index: Int

    var exercise: Exercise {
        Exercise.exercises[index]
    }

    let interval: TimeInterval = 30

    var body: some View {
        GeometryReader { geometry in
            VStack {
                FitStrikeHeader(exerciseName: exercise.excersiceName)
                    .padding(.bottom)

                if let url = Bundle.main.url(forResource: exercise.videoName, withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(height: geometry.size.height * 0.45)
                } else {
                    Text("Couldn't find \(exercise.videoName).mp4")
                        .foregroundColor(.red)
                }

                Text(Date().addingTimeInterval(interval), style: .timer)
                    .font(.system(size: geometry.size.height * 0.07))
                Button("Start/Done button") {}
                    .font(.title3)
                    .padding()

                RatingView().padding()

                Spacer()
                Button("History") {}
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    ExerciseView(index: 0)
}
