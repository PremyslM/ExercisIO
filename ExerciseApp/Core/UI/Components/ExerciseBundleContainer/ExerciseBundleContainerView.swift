//
//  ExerciseBundleContainerView.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import SwiftUI


struct ExerciseBundleContainerView: View {
    
    private var viewModel: ExerciseBundleContainerViewModel
    
    init(exerciseBundle bundle: ExerciseBundle) {
        self.viewModel = ExerciseBundleContainerViewModel(bundle)
    }
    
    var body: some View {
        ZStack {
            Color.black
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(viewModel.title) // Title
                        .font(.title2)
                    Text(viewModel.exerciseCount) // Exercises Count
                        .font(.system(size: 16, weight: .light))
                }
                
                Spacer()
                                    
                Text(viewModel.duration) // Duration
            }
            .foregroundStyle(Color.white)
            .padding()
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .frame(maxHeight: 200)
    }
}

#Preview {
    ExerciseBundleContainerView(exerciseBundle: TestData.exerciseBundles[0])
}
