//
//  ExerciseBundleDetail.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import SwiftUI


struct ExerciseBundleDetailView: View {
    
    private var viewModel: ExerciseBundleDetailViewModel
    
    init(exerciseList: [Exercise]) {
        self.viewModel = ExerciseBundleDetailViewModel(exerciseList)
    }
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(viewModel.exerciseList) { exercise in
                        Text(exercise.title)
                    }
                }
            }
        }
    }
}

#Preview {
    ExerciseBundleDetailView(exerciseList: TestData.exerciseBundles[0].exercises)
}
