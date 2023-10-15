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
            
            HStack {
                VStack(alignment: .leading, spacing: 15) {
                    ForEach(viewModel.exerciseBundle.exercises) { exercise in
                        HStack {
                            Text(exercise.title)
                                .fontWeight(.semibold)
                            Text("difficulty ") + Text("\(exercise.difficulty)").fontWeight(.semibold).foregroundStyle(Color(UIColor.systemBlue))
                            
                            Spacer()
                            
                            Text("\(Int(exercise.duration)) min")
                                .foregroundStyle(Color(UIColor.systemGreen))
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.black)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding()
            }
            
            Spacer()
        }
    }
}

#Preview {
    ExerciseBundleDetailView(exerciseBundle: TestData.exerciseBundles[0])
}
