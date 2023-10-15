//
//  ExerciseBundleContainerViewModel.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import SwiftUI


class ExerciseBundleContainerViewModel: ObservableObject {
    @Published private(set) var isActive: Bool = false {
        didSet {
            print("DEBUG: Is Active [\(isActive)]")
        }
    }
    @Published var activeColor: Color = .black
    
    private var exerciseBundle: ExerciseBundle
    
    var title: String {
        let title = exerciseBundle.title
        return title
    }
    
    var duration: String {
        var durationSum: Double = 0.0
        
        let exercises = exerciseBundle.exercises
        
        for exercise in exercises {
            durationSum += exercise.duration
        }
        
        return "\(durationSum)min"
    }
    
    var exerciseCount: String {
        let exercises = exerciseBundle.exercises
        return "\(exercises.count) exercises"
    }
    
    init(_ exerciseBundle: ExerciseBundle) {
        self.exerciseBundle = exerciseBundle
    }
    
    func setActive() {
        self.isActive = true
        self.activeColor = isActive ? Color(UIColor.systemGreen) : Color(.black)
    }
}
