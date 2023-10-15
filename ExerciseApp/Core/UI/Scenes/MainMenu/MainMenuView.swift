//
//  ContentView.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import SwiftUI

struct MainMenuView: View {
    @StateObject private var viewModel = MainMenuViewModel()
    
    var body: some View {
        ZStack {
            List {
                ForEach(viewModel.bundles) { bundle in
                    ExerciseBundleContainerView(exerciseBundle: bundle)
                }
            }
        }
    }
}

#Preview {
    MainMenuView()
}
