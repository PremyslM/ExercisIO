//
//  MainMenuViewModel.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import Foundation


class MainMenuViewModel: ObservableObject {
    @Published var bundles: [ExerciseBundle] = []
    
    private let dataService = DataService()
    
    init() {
        dataService.fetchBundles { result in
            self.bundles = result
        }
    }
    
    
}
