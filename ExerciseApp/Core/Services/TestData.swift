//
//  TestData.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import Foundation

class TestData {
    static let exerciseBundles = [
        ExerciseBundle(title: "Morning Workout",
                       exercises: [
                        Exercise(title: "Push-ups", duration: 15.0, difficulty: 3),
                        Exercise(title: "Sit-ups", duration: 10.0, difficulty: 2)
                       ]),
        ExerciseBundle(title: "Evening Workout",
                       exercises: [
                        Exercise(title: "Sit-ups", duration: 10.0, difficulty: 2),
                        Exercise(title: "Squats", duration: 20.0, difficulty: 4)
                       ]),
        ExerciseBundle(title: "Full Body Workout", 
                       exercises: [
                        Exercise(title: "Push-ups", duration: 15.0, difficulty: 3),
                        Exercise(title: "Sit-ups", duration: 10.0, difficulty: 2),
                        Exercise(title: "Squats", duration: 20.0, difficulty: 4)
                       ])
    ]
}
