//
//  ExerciseBundleDetailViewModel.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import Foundation


class ExerciseBundleDetailViewModel {
    
    var exerciseList: [Exercise]
    
    init(_ exerciseList: [Exercise]) {
        self.exerciseList = exerciseList
    }
}
