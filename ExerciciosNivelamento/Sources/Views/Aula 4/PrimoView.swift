//
//  PrimoView.swift
//  ExerciciosNivelamento
//
//  Created by Vinícius Binder on 06/05/21.
//

import SwiftUI

struct PrimoView: View {
    @State private var bound: (lower: Int, upper: Int) = (0, 10)
    @State private var lowerBoundText = "0"
    @State private var upperBoundText = "10"
    
    var body: some View {
        VStack {
            HStack {
                NumericTextField(title: "Lower Bound (Int)", text: $lowerBoundText, value: lowerBoundText, action: handleChange)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(.blue)
                    .minimumScaleFactor(0.1)
                Text("  . . <  ")
                NumericTextField(title: "Upper Bound (Int)", text: $upperBoundText, value: upperBoundText, action: handleChange)
                    .foregroundColor(.blue)
                    .minimumScaleFactor(0.1)
            }
            .font(.title2.bold())
            .padding(.horizontal)
            
            List {
                ForEach(bound.lower..<bound.upper, id: \.self) { number in
                    HStack {
                        Text("\(number)")
                        Spacer()
                        if ExerciciosNivelamento.ehPrimo(number) {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: "xmark.seal.fill")
                                .foregroundColor(.red)
                        }
                    }
                    .animation(.easeInOut)
                }
            }
        }
    }
    
    private func handleChange<T>(_: T) {
        guard let lower = Int(lowerBoundText), let upper = Int(upperBoundText),
              lower <= upper
        else { return }
        
        withAnimation {
            bound = (lower, upper)
        }
    }
}

struct PrimoView_Previews: PreviewProvider {
    static var previews: some View {
        PrimoView()
    }
}
