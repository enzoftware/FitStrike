//
//  Exercise.swift
//  FitStrike
//
//  Created by Enzo Lizama on 21/08/24.
//

struct Exercise {
    let exerciseName: String
    let videoName: String

    enum ExcersiceEnum: String {
        case squat = "Squat"
        case stepUp = "Step Up"
        case burpee = "Burpee"
        case sunSalute = "Sun Salute"
    }
}

extension Exercise {
    static let exercises = [
        Exercise(exerciseName: ExcersiceEnum.squat.rawValue, videoName: "squat"),
        Exercise(exerciseName: ExcersiceEnum.stepUp.rawValue, videoName: "step-up"),
        Exercise(exerciseName: ExcersiceEnum.burpee.rawValue, videoName: "burpee"),
        Exercise(exerciseName: ExcersiceEnum.sunSalute.rawValue, videoName: "sun-salute")
    ]
}
