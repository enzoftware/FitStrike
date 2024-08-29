//
//  SuccessView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 28/08/24.
//

import SwiftUI

struct SuccessView: View {
    let message = """
    Good job!
    You've completed the task.
    Keep up the great work!
    """

    @Environment(\.dismiss)
    var dismiss

    @Binding var selectedTab: Int

    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                    .padding()

                Text("High Five!")
                    .padding(.bottom)
                    .fontWeight(.bold)
                    .font(.title)

                Text(message)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }

            VStack {
                Spacer()
                Button(action: {
                    dismiss()
                    selectedTab = 9
                }, label: {
                    Text("Continue")
                })
            }
        }.presentationDetents([.medium, .large])
    }
}

#Preview {
    SuccessView(selectedTab: .constant(3))
}
