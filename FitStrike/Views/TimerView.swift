//
//  TimeLineView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 1/09/24.
//

import SwiftUI

struct CountdownView: View {
    let date: Date
    let size: Double

    @Binding var timeRemaining: Int

    var body: some View {
        Text("\(timeRemaining)")
            .font(.system(size: size, design: .rounded))
            .padding()
            .onChange(of: date) { _, _ in
                timeRemaining -= 1
            }
    }
}

struct TimerView: View {
    let size: Double

    @State private var timeRemaining = 3
    @Binding var timerDone: Bool

    var body: some View {
        TimelineView(
            .animation(
                minimumInterval: 1.0,
                paused: timeRemaining <= 0
            )
        ) { context in
            CountdownView(date: context.date, size: size, timeRemaining: $timeRemaining)
        }
        .onChange(of: timeRemaining) { _, _ in
            if timeRemaining < 1 {
                timerDone = true
            }
        }
    }
}

#Preview {
    TimerView(size: 90, timerDone: .constant(false))
}
