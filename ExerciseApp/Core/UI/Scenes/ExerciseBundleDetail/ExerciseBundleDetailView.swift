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
        VStack {
            HStack {
                Text(viewModel.title) // Title
                Text(viewModel.duration) // Duration
                Text(viewModel.exerciseCount) // Count
            }
            .padding()
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .foregroundStyle(Color.white)
            .padding()
            
            List {
                ForEach(viewModel.exerciseBundle.exercises) { exercise in
                    Text(exercise.title)
                }
            }
        }
    }
}

#Preview {
    ExerciseBundleDetailView(exerciseBundle: TestData.exerciseBundles[0])
}
