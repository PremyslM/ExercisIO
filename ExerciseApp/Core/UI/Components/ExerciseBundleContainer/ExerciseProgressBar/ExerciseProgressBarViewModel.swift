//
//  ExerciseProgressBarViewModel.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 22.10.2023.
//

import Foundation

protocol ExerciseProgressBarDataSource {
    func getBundle() -> ExerciseBundle
}


class ExerciseProgressBarViewModel: ObservableObject {
    @Published var countdownDuration: Double = 0 {
        didSet {
            print("DEBUG: Countdown duration \(countdownDuration)")
            updateProgressFormatedCountDownDuration()
        }
    }
    
    @Published var progressFormatedCountDownDuration: Double
    
    var exerciseBundle: ExerciseBundle? {
        didSet {
            print("DEBUG: Bundle set")
            self.countdownDuration = exerciseBundle!.totalDuration
            updateProgressFormatedCountDownDuration() // Calculate it here
            getInfo()
        }
    }
    
    var dataSource: ExerciseProgressBarDataSource? {
        didSet {
            self.exerciseBundle = dataSource!.getBundle()
        }
    }
    
    init() {
        self.progressFormatedCountDownDuration = 0 // Initialize it here
    }
    
    func updateProgressFormatedCountDownDuration() {
        self.progressFormatedCountDownDuration = (countdownDuration / exerciseBundle!.totalDuration) * 100
        print("FORM - \(self.progressFormatedCountDownDuration)")
    }
    
    func getInfo() {
        print("DEBUG cd: \(countdownDuration)")
        print("DEBUG cd form: \(progressFormatedCountDownDuration)")
    }
}
