import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistoryStore: ObservableObject {
    @Published var exerciseDays: [ExerciseDay] = []

    init() {
        #if DEBUG
        createDevData()
        #endif
    }

    func addDoneExercise(_ exercise: String) {
        let today = Date()
        if today.isSameDay(as: exerciseDays[0].date) {
            debugPrint("Adding \(exercise)")
            exerciseDays[0].exercises.append(exercise)
        } else {
            exerciseDays.insert(ExerciseDay(date: today, exercises: [exercise]), at: 0)
        }
    }
}
