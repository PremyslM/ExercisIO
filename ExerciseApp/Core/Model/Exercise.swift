//
//  Exercise.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import Foundation


struct Exercise: Identifiable {
    var id = UUID()
    let title: String
    let duration: Double
    let difficulty: Int
}
