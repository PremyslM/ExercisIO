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
}
