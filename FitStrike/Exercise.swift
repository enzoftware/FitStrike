//
//  Exercise.swift
//  FitStrike
//
//  Created by Enzo Lizama on 21/08/24.
//

struct Exercise {
    let excersiceName: String
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
        Exercise(excersiceName: ExcersiceEnum.squat.rawValue, videoName: "squat"),
        Exercise(excersiceName: ExcersiceEnum.stepUp.rawValue, videoName: "step-up"),
        Exercise(excersiceName: ExcersiceEnum.burpee.rawValue, videoName: "burpee"),
        Exercise(excersiceName: ExcersiceEnum.sunSalute.rawValue, videoName: "sun-salute")
    ]
}
