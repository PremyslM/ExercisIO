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
            Color(UIColor.systemGray4)
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                ForEach(viewModel.bundles) { bundle in
                    ExerciseBundleContainerView(exerciseBundle: bundle)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("worbit")
    }
}

#Preview {
    MainMenuView()
}
