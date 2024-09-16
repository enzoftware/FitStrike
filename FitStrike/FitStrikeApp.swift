//
//  FitStrikeApp.swift
//  FitStrike
//
//  Created by Enzo Lizama on 19/08/24.
//

import SwiftUI

@main
struct FitStrikeApp: App {
    @StateObject private var historyStore = HistoryStore()

    var body: some Scene {
        WindowGroup {
            ContentView().onAppear(perform: {
                debugPrint(URL.documentsDirectory)
            }).alert(isPresented: $historyStore.loadingError, content: {
                Alert(title: Text("History"), message: Text(
                    """
                    Unfortunately we can't load your past history.
                    Email support:
                      support@xyz.com
                    """))
            })
        }.environmentObject(historyStore)
    }
}
