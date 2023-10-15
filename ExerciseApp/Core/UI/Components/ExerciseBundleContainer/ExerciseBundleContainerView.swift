//
//  ExerciseBundleContainerView.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 15.10.2023.
//

import SwiftUI


struct ExerciseBundleContainerView: View {
    
    @ObservedObject private var viewModel: ExerciseBundleContainerViewModel
    private var destination: ExerciseBundleDetailView
    
    init(exerciseBundle bundle: ExerciseBundle, desctination: ExerciseBundleDetailView) {
        self.viewModel = ExerciseBundleContainerViewModel(bundle)
        self.destination = desctination
    }
    
    var body: some View {
        NavigationLink {
            destination
        } label: {
            HStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(viewModel.title) // Title
                            .font(.title2)
                        Text(viewModel.exerciseCount) // Exercises Count
                            .font(.system(size: 16, weight: .light))
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text(viewModel.duration) // Duration
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
                        viewModel.setActive()
                    }
                }
            }
            .frame(height: 100)
            .background(viewModel.isActive ? .green : .black)
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }

    }
    
}
