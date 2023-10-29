//
//  ExerciseBundle.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import Foundation


struct ExerciseBundle: Identifiable {
    var id = UUID()
    let title: String
    let exercises: [Exercise]
    
    var totalDuration: Double {
        var result: Double = 0
        
        for exercise in exercises {
            result += exercise.duration
        }
        
        return result
    }
    
    static let DUMP_EXERCISEBUNDLE: ExerciseBundle = ExerciseBundle(title: "Test Bundle", exercises: [
        Exercise(title: "Exercise 1", duration: 23, difficulty: 5),
        Exercise(title: "Exercise 2", duration: 17, difficulty: 2),
        Exercise(title: "Exercise 3", duration: 43, difficulty: 1),
        Exercise(title: "Exercise 4", duration: 10, difficulty: 3),
    ])
}
