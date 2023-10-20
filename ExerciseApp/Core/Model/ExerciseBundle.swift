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
}
