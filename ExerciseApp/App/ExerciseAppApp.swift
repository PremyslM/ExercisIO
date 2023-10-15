//
//  ExerciseAppApp.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import SwiftUI

@main
struct ExerciseAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                MainMenuView()
            })
        }
    }
}
