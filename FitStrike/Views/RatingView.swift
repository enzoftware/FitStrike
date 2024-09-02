//
//  RatingView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 26/08/24.
//

import SwiftUI

struct RatingView: View {
    let exerciseIndex: Int

    /// Here you hold rating locally and set up ratings to be a string of four zeros.
    @AppStorage("ratings") private var storageRatings = ""

    @State private var rating = 0

    let maximumRating = 5

    let onColor = Color.red
    let offColor = Color.gray

    init(exerciseIndex: Int) {
        self.exerciseIndex = exerciseIndex
        let desireLength = Exercise.exercises.count
        if storageRatings.count < desireLength {
            self.storageRatings = storageRatings.padding(
                toLength: desireLength,
                withPad: "0",
                startingAt: 0
            )
        }
    }

    func updateRating(index: Int) {
        rating = index
        let index = storageRatings.index(storageRatings.startIndex, offsetBy: exerciseIndex)
        storageRatings.replaceSubrange(index ... index, with: String(rating))
    }

    fileprivate func convertRating() {
        let index = storageRatings.index(storageRatings.startIndex, offsetBy: exerciseIndex)
        let character = storageRatings[index]
        rating = character.wholeNumberValue ?? 0
    }

    var body: some View {
        HStack {
            ForEach(0 ..< maximumRating, id: \.self) { index in

                let ratingReached = index < rating
                let color = ratingReached ? onColor : offColor

                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(color)
                    .onChange(of: storageRatings) { _, _ in
                        convertRating()
                    }
                    .onAppear {
                        convertRating()
                    }
                    .onTapGesture {
                        updateRating(index: index)
                    }
            }.font(.largeTitle)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView(exerciseIndex: 0)
}
