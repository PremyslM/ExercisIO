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
                    .fontWeight(.bold)
                Text(viewModel.duration) // Duration
                Text(viewModel.exerciseCount) // Count
                
                Image(systemName: "smallcircle.filled.circle.fill") // isActive UIImage TODO: Future UI element that'll shows if current bundle is active (if user is doing it)
                    .foregroundStyle(Color(UIColor.systemRed)) // SystemRed (active) / SystemGreen (non-active)
                    .shadow(color: .green, radius: 9)
            }
            .padding()
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .foregroundStyle(Color.white)
            //.padding()
            
            List {
                ForEach(viewModel.exerciseBundle.exercises) { exercise in
                    Text(exercise.title)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ExerciseBundleDetailView(exerciseBundle: TestData.exerciseBundles[0])
}
