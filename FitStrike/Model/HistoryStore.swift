import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

struct HistoryStore {
    init() {
        #if DEBUG
        createDevData()
        #endif
    }

    var exerciseDays: [ExerciseDay] = []
}


