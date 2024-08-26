//
//  RatingView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 26/08/24.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        HStack {
            ForEach(0 ..< 5) { _ in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    RatingView()
}
