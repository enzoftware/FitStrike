//
//  RatingView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 26/08/24.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int

    let maximumRating = 5

    let onColor = Color.red
    let offColor = Color.gray

    var body: some View {
        HStack {
            ForEach(0 ..< maximumRating, id: \.self) { index in

                let ratingReached = index < rating
                let color = ratingReached ? onColor : offColor

                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(color)
                    .onTapGesture {
                        rating = index
                    }
            }.font(.largeTitle)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView(rating: .constant(3))
}
