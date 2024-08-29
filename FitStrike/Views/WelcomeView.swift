//
//  WelcomeView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 20/08/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            VStack {
                FitStrikeHeader(titleText: "Welcome")
                Spacer()
                Button("History") {}.padding(.bottom)
            }
            VStack {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading) {
                        Text("Get fit")
                            .font(.largeTitle)
                        Text("with high intensity interval training")
                            .font(.headline)
                    }
                    Image("step-up")
                        .resizedToFill(width: 240, height: 240)
                        .clipShape(Circle())
                }
                Button(
                    action: {},
                    label: {
//                        Text("Get Started")
//                        Image(systemName: "arrow.right.circle")
                        Label("Get Started", systemImage: "arrow.right.circle")
                    }
                )
                .font(.title2)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.gray, lineWidth: 2)
                )
            }
        }
    }
}

#Preview {
    WelcomeView()
}
