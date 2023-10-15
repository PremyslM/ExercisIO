//
//  DataService.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import Foundation

class DataService {
    
    func fetchBundles(completion: @escaping ([ExerciseBundle]) -> Void) {
        let data = TestData.exerciseBundles
        completion(data)
    }
}
