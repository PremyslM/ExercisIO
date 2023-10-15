//
//  ExerciseBundleDetail.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import SwiftUI


struct ExerciseBundleDetailView: View {
    
    private var viewModel: ExerciseBundleDetailViewModel
    
    init(exerciseBundle: ExerciseBundle) {
        self.viewModel = ExerciseBundleDetailViewModel(exerciseBundle)
    }
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(viewModel.exerciseBundle.exercises) { exercise in
                        Text(exercise.title)
                    }
                }
            }
        }
    }
}

#Preview {
    ExerciseBundleDetailView(exerciseBundle: TestData.exerciseBundles[0])
}
