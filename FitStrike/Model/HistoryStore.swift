import Foundation

struct ExerciseDay: Identifiable {
    let id = UUID()
    let date: Date
    var exercises: [String] = []
}

class HistoryStore: ObservableObject {
    enum FileError: Error {
        case loadFailure
        case saveFailure
    }

    @Published var exerciseDays: [ExerciseDay] = []
    @Published var loadingError = false

    init() {
        do {
            try load()
        } catch {
            loadingError = true
            print("Error:", error)
        }
    }

    var dataUrl: URL {
        URL.documentsDirectory.appendingPathComponent("history.plist")
    }

    func addDoneExercise(_ exercise: String) {
        let today = Date()
        if let firstDate = exerciseDays.first?.date, today.isSameDay(as: firstDate) {
            debugPrint("Adding \(exercise)")
            exerciseDays[0].exercises.append(exercise)
        } else {
            exerciseDays.insert(ExerciseDay(date: today, exercises: [exercise]), at: 0)
        }

        do {
            try save()
            print("History: ", exerciseDays)
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func load() throws {
        guard let data = try? Data(contentsOf: dataUrl) else {
            return
        }
        do {
            let plistData = try PropertyListSerialization.propertyList(
                from: data,
                options: [],
                format: nil)

            let convertedPlistData = plistData as? [[Any]] ?? []

            exerciseDays = convertedPlistData.map {
                ExerciseDay(
                    date: $0[1] as? Date ?? Date(),
                    exercises: $0[2] as? [String] ?? [])
            }
        } catch {
            throw FileError.loadFailure
        }
    }

    func save() throws {
        let plistData = exerciseDays.map {
            [$0.id.uuidString, $0.date, $0.exercises]
        }
        do {
            let data = try PropertyListSerialization.data(
                fromPropertyList: plistData,
                format: .binary,
                options: .zero)
            try data.write(to: dataUrl, options: .atomic)
        } catch {
            throw FileError.saveFailure
        }
    }
}
