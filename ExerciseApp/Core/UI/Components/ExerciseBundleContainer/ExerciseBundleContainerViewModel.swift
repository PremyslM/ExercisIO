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
    @Published var countdownValue: Double { // TODO: Harcoded Value -> This'll be taken from stored models (Exercise models)
        didSet {
            self.checkTimer(countdownValue)
        }
    }
    
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
    private var timerManager: TimerManager?
    

    init(_ exerciseBundle: ExerciseBundle, destination: ExerciseBundleDetailView) {
        self.destination = destination
        self.exerciseBundle = exerciseBundle
        self.countdownValue = exerciseBundle.totalDuration
        self.timerManager = TimerManager(onUpdateTimer: {
            self.countdownValue -= 1
            print(self.countdownValue)
        })
    }
    
    // MARK: - Public Methods
    func exerciseLongPressed() {
        if !isActive {
            self.setActive()
            self.destination.viewModel.setActive()
        }
    }
    
    // MARK: - Private Methods
    private func setActive() {
        self.startTimer()
        self.isActive = true
        self.activeColor = isActive ? Color(UIColor.systemGreen) : Color(.black)
    }
    
    private func startTimer() {
        if self.countdownValue > 0 {
            self.timerManager?.startTimer()
        }
    }
    
    private func checkTimer(_ value: Double) {
        if value <= 0 {
            self.timerManager?.stopTimer()
        }
    }
}
