//
//  TimerManager.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 18.10.2023.
//

import Foundation


class TimerManager {
    
    var onUpdateTimer: () -> Void
    private var timer: Timer?
    
    init(onUpdateTimer onUpdate: @escaping () -> Void) {
        self.onUpdateTimer = onUpdate
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { result in
            self.onUpdateTimer()
        })
    }
    
    func stopTimer() {
        print("TRY TO STOP !")
        guard let timer = timer else { return }
        print("DEBUG: STOPPED")
        timer.invalidate()
    }
    
}
