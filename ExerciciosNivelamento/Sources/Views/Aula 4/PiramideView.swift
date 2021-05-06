//
//  PiramideView.swift
//  ExerciciosNivelamento
//
//  Created by Vinícius Binder on 05/05/21.
//

import SwiftUI

struct PiramideView: View {
    @State private var balls = 0
    @State private var levels = 0
    @State private var ballSize: CGSize = .zero
    @State private var ballAssets: [Int: String] = [:]
    
    var body: some View {
        VStack {
            Stepper("Qtde de bolas: \(balls)", value: $balls)
                .onChange(of: balls) { value in
                    levels = ExerciciosNivelamento.nivelDePiramide(paraBolas: value)
                    for level in 0..<levels {
                        for ball in 0...level {
                            let index = pyramidIndex(forLevel: level)+ball
                            if ballAssets[index] == nil {
                                ballAssets[index] = "ball-\((1...15).randomElement() ?? 1)"
                            }
                        }
                    }
                }
            
            Text("Qtde de níveis: \(levels)")
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.red)
            
            Spacer()
            
            VStack {
                ForEach(0..<levels, id: \.self) { level in
                    HStack {
                        ForEach(0...level, id: \.self) { ball in
                            let index = pyramidIndex(forLevel: level)+ball
                            if level == levels-1 {
                                Image(ballAssets[index] ?? "ball-1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .sizeAwareness(viewSize: $ballSize)
                            } else {
                                Image(ballAssets[index] ?? "ball-1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: ballSize.height)
                            }
                        }
                    }
                    // Não consegui fazer essa animação funcionar 🤡
//                    .transition(.move(edge: .bottom))
//                    .animation(.easeInOut, value: levels)
                }
            }
            
            Spacer()
        }
    }
    
    private func pyramidIndex(forLevel level: Int) -> Int {
        level == 0 ? 0 : (1...level).reduce(1, +)
    }
    
}

struct PiramideView_Previews: PreviewProvider {
    static var previews: some View {
        PiramideView()
    }
}
