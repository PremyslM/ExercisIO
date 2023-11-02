//
//  ExerciseProgressBarView.swift
//  ExerciseApp
//
//  Created by Přemysl Mikulenka on 22.10.2023.
//

import SwiftUI


struct ExerciseProgressBarView: View {
    fileprivate var bundle: ExerciseBundle
    
    @StateObject private var viewModel: ExerciseProgressBarViewModel = ExerciseProgressBarViewModel()//TODO: Bundle is not setted. !!
    
    init(_ bundle: ExerciseBundle) {
        self.bundle = bundle        // TODO: Create a data source protocol that will be called from ExerciseProgressBarViewModel in ExerciseProgressBarView and it'll get (as a parameter): (_ bundle: ExerciseBundle)
        self.viewModel.dataSource = self
    }
    
    var body: some View {
        GeometryReader(content: { proxy in
            ZStack {
                // Progress background
                Rectangle()
                    .fill(
                        Color(.systemGray6)
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 6)
                    )
                
                // Progress Idnicator
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: proxy.size.width * CGFloat(viewModel.progressFormatedCountDownDuration))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 6)
                        )
                    
                    HStack {
                        Spacer()
                        ForEach(0..<10) { num in
                            Rectangle()
                                .fill(Color(viewModel.countdownDuration > Double(num) * 0.1 ? .systemGreen : .systemRed))
                                .padding(.vertical, 2)
                                .frame(width: 1)
                            Spacer()
                        }
                    }
                }
                .clipShape(
                    RoundedRectangle(cornerRadius: 6)
                )
                .padding(2)
            }
            .frame(height: 20)
        })
    }
}

extension ExerciseProgressBarView: ExerciseProgressBarDataSource {
    
    func getBundle() -> ExerciseBundle {
        return self.bundle
    }
    
    
}
