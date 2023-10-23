//
//  ExerciseProgressBarViewModel.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 22.10.2023.
//

import Foundation

class ExerciseProgressBarViewModel: ObservableObject {
    @Published var countdownDuration: Double = 0 {
        didSet {
            setConfig()
            print("FORM - \(self.progressFormatedCountDownDuration)")
        }
    }
    @Published var progressFormatedCountDownDuration: Double {
        didSet {
            print("FORM - \(self.progressFormatedCountDownDuration)")
        }
    }
    
    var exerciseBundle: ExerciseBundle? {
        didSet {
            print("DUBGU: Bundle setted")
            self.countdownDuration = exerciseBundle?.totalDuration ?? 0
            getInfo()
        }
    }
            
    init() {
        self.progressFormatedCountDownDuration = 0
    }
    
    func setConfig() {        
        self.progressFormatedCountDownDuration = (countdownDuration / exerciseBundle!.totalDuration) * 100
        print("FORM - \(self.progressFormatedCountDownDuration)")
    }
    
    func getInfo() {
        print("DEBUG cd: \(countdownDuration)")
        print("DEBUG cd form: \(progressFormatedCountDownDuration)")
        //print("DEBUG cd static: \(exerciseBundle!.totalDuration)")
    }
}
