//
//  ExerciseBundleContainerViewModel.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import SwiftUI


class ExerciseBundleContainerViewModel: ExerciseTimerViewModel, Bundleable {
    
    @Published var activeColor: Color = .black
    
    // MARK: - Public Attributes
    var destination: ExerciseBundleDetailView
        
    var title: String {
        let title = exerciseBundle.title
        return title
    }
    
    var formatedDuration: String {
        var durationSum: Double = 0.0
        
        let exercises = exerciseBundle.exercises
        
        for exercise in exercises {
            durationSum += exercise.duration
        }
        
        return "\(durationSum)min"
    }
    
    var duration: Double {
        var durationSum: Double = 0.0
        
        let exercises = exerciseBundle.exercises
        
        for exercise in exercises {
            durationSum += exercise.duration
        }
        
        return durationSum
    }
    
    var exerciseCount: String {
        let exercises = exerciseBundle.exercises
        return "\(exercises.count) exercises"
    }
    
    // MARK: - Private Attributes
    private var exerciseBundle: ExerciseBundle {
        didSet {
            self.countdownValue = self.duration
        }
    }    
    

    init(_ exerciseBundle: ExerciseBundle, destination: ExerciseBundleDetailView) {
        self.destination = destination
        self.exerciseBundle = exerciseBundle
        super.init()
        self.countdownValue = exerciseBundle.totalDuration
        super.dataSource = self
    }
    
    // MARK: - Public Methods
    func exerciseLongPressed() {
        super.exerciseLongPressed {
            // TODO: Destination.setActive()
            print("pressed")
        }
    }
    
    func getExerciseBundle() -> ExerciseBundle {
        return exerciseBundle
    }
                
}
