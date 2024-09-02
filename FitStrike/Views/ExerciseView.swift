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

    @EnvironmentObject var history: HistoryStore

    @State private var rating = 0
    @State private var showSuccess = false
    @State private var timerDone = false
    @State private var showTimer = false
    @State private var showHistory = false

    @Binding var selectedTab: Int

    var exercise: Exercise {
        Exercise.exercises[index]
    }

    var lastExercise: Bool {
        index + 1 == Exercise.exercises.count
    }

    var startButton: some View {
        Button("Start") {
            showTimer.toggle()
        }
    }

    /// Tapping *Done* goes to the next `ExerciseView`, and tapping *Done* in the last `ExerciseView` goes to `WelcomeView`.
    var doneButton: some View {
        Button("Done") {
            history.addDoneExercise(Exercise.exercises[index].exerciseName)
            timerDone = false
            showTimer.toggle()
            if lastExercise {
                showSuccess.toggle()
            } else {
                selectedTab += 1
            }
        }
    }

    let interval: TimeInterval = 30

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                FitStrikeHeader(
                    titleText: exercise.exerciseName,
                    selectedTab: $selectedTab
                )
                .padding(.bottom)

                VideoPlayerView(
                    height: geometry.size.height * 0.45,
                    videoName: exercise.videoName
                )

//                Text(Date().addingTimeInterval(interval), style: .timer)
//                    .font(.system(size: geometry.size.height * 0.07))

                HStack(spacing: 150) {
                    startButton
                    doneButton
                        .disabled(!timerDone)
                        .sheet(isPresented: $showSuccess, content: {
                            SuccessView(selectedTab: $selectedTab)
                        })
                }
                .font(.title3)
                .padding()

                if showTimer {
                    TimerView(size: geometry.size.height * 0.05, timerDone: $timerDone)
                }

                Spacer()
                RatingView(rating: $rating).padding()
                Button("History") {
                    showHistory.toggle()
                }
                .padding(.bottom)
                .sheet(isPresented: $showHistory, content: {
                    HistoryView(showHistory: $showHistory)
                })
            }
        }
    }
}

#Preview {
    ExerciseView(index: 3, selectedTab: .constant(3)).environmentObject(HistoryStore())
}
