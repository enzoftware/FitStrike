//
//  WelcomeView.swift
//  FitStrike
//
//  Created by Enzo Lizama on 20/08/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showHistory = false
    @Binding var selectedTab: Int

    var body: some View {
        ZStack {
            VStack {
                FitStrikeHeader(titleText: "Welcome", selectedTab: $selectedTab)
                Spacer()
                Button("History") {
                    showHistory.toggle()
                }
                .sheet(isPresented: $showHistory, content: {
                    HistoryView(showHistory: $showHistory)
                })
                .padding(.bottom)
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
                        .resizedToFill(width: 200, height: 200)
                        .clipShape(Circle())
                }
                .padding()

                Button(
                    action: {
                        selectedTab = 0
                    },
                    label: {
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
    WelcomeView(selectedTab: .constant(1))
}
