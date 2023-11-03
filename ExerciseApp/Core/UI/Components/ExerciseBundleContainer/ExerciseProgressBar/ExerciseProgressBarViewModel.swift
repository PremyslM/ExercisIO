//
//  ExerciseProgressBarViewModel.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 22.10.2023.
//

import Foundation

class ExerciseProgressBarViewModel: ExerciseTimerViewModel, Bundleable {
    
    @Published var progressFormatedCountDownDuration: Double
    
    private var exerciseBundle: ExerciseBundle {
        didSet {
            self.updateProgressFormatedCountDownDuration()
        }
    }
    
    init(bundle: ExerciseBundle) {
        self.progressFormatedCountDownDuration = 0 // Initialize it here
        self.exerciseBundle = bundle
        
        super.init()
    }
    
    func updateProgressFormatedCountDownDuration() {
        self.progressFormatedCountDownDuration = (super.countdownValue! / exerciseBundle.totalDuration) * 100
        print("FORM - \(self.progressFormatedCountDownDuration)")
    }
    
    func getInfo() {
        print("DEBUG cd: \(super.countdownValue)")
        print("DEBUG cd form: \(progressFormatedCountDownDuration)")
    }
    
    func getExerciseBundle() -> ExerciseBundle {
        return self.exerciseBundle
    }
}
