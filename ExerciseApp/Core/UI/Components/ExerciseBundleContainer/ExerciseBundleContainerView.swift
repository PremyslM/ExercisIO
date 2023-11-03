//
//  ExerciseBundleContainerView.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import SwiftUI


struct ExerciseBundleContainerView: View {
    @ObservedObject private var viewModel: ExerciseBundleContainerViewModel
    
    private var exerciseBundle: ExerciseBundle
    
    init(exerciseBundle bundle: ExerciseBundle) {
        let destination = ExerciseBundleDetailView(exerciseBundle: bundle)
        self.viewModel = ExerciseBundleContainerViewModel(bundle, destination: destination)
        self.exerciseBundle = bundle
    }
    
    var body: some View {
        NavigationLink {
            viewModel.destination
        } label: {
            HStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(viewModel.title) // Title
                            .font(.title2)
                        Text(viewModel.exerciseCount) // Exercises Count
                            .font(.system(size: 16, weight: .light))
                        ExerciseProgressBarView(exerciseBundle)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("\(Int(viewModel.countdownValue!))s") // Duration
                        Spacer()
                    }
                }
                .padding()
                                    
                
                ZStack {
                    Color.gray.opacity(0.2)
                    Image(systemName: "hand.tap.fill")
                        .font(.system(size: 20))
                }
                .frame(width: 75)
                .onLongPressGesture {
                    withAnimation {
                        viewModel.exerciseLongPressed()
                    }
                }
            }
            .frame(height: 100)
            .background(viewModel.activeColor)
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}
