//
//  ExerciseTimerViewModel.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 02.11.2023.
//

import Foundation
import SwiftUI

protocol Bundleable {
    func getExerciseBundle() -> ExerciseBundle
}


class ExerciseTimerViewModel: ObservableObject {
    var dataSource: Bundleable?
    
    private var exerciseBundle: ExerciseBundle? {
        didSet {
            self.countdownValue = exerciseBundle!.totalDuration
        }
    }
    
    @Published private(set) var isActive: Bool = false
    
    @Published var countdownValue: Double? { // TODO: Harcoded Value -> This'll be taken from stored models (Exercise models)
        didSet {
            self.checkTimer(countdownValue!)
        }
    }
    @Published var countdownPersentageValue: Double? // TODO: get percentage value bases in countdownValue of timer.
    
    private var duration: Double {
        var durationSum: Double = 0.0
        
        if let exerciseBundle = exerciseBundle {
            let exercises = exerciseBundle.exercises
            
            for exercise in exercises {
                durationSum += exercise.duration
            }
        }
        
        return durationSum
    }
    
    private var timerManager: TimerManager?
    
    init() {        
        self.exerciseBundle = dataSource?.getExerciseBundle()
        self.timerManager = TimerManager(onUpdateTimer: {
            self.countdownValue! -= 1 
        })
    }
    
    // MARK: - Public Methods
    func exerciseLongPressed(_ completion: @escaping () -> Void) {
        if !isActive {
            self.setActive()
            //self.destination.viewModel.setActive()
            completion()
        }
    }
    
    // MARK: - Private Methods
    private func setActive() {
        self.startTimer()
        self.isActive = true
        //self.activeColor = isActive ? Color(UIColor.systemGreen) : Color(.black)
    }
    
    private func checkTimer(_ value: Double) {
        if value <= 0 {
            self.timerManager?.stopTimer()
        }
    }
    
    private func startTimer() {
        if self.countdownValue! > 0 {
            self.timerManager?.startTimer()
        }
    }
    
}
