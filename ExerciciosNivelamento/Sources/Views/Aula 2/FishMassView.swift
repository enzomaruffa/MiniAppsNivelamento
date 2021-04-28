//
//  FishMassView.swift
//  ExerciciosNivelamento
//
//  Created by Vinícius Binder on 25/04/21.
//

import SwiftUI

struct FishMassView: View {
    
    @State private var humanMass: String = ""
    @State private var fishMass: Double = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Densidade do mercúrio")
                .font(.largeTitle)
                .bold()
                .lineLimit(nil)
            NumericTextField(title: "Massa do ser humano (kg)", text: $humanMass, value: humanMass, action: handleChange)
            
            HStack {
                Image("fish-body")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(Text(String(format: "%.2f", fishMass) + " kg").foregroundColor(.white).bold().background(Color.black))
                Image("human-body")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(Text(humanMass + " kg").foregroundColor(.white).bold().background(Color.black))
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func handleChange<T>(_: T) {
        guard let humanMass = Double(humanMass) else { return }
        fishMass = ExerciciosNivelamento.massaDePeixeComestivel(paraMassaHumana: humanMass)
    }
}

struct FishMassView_Previews: PreviewProvider {
    static var previews: some View {
        FishMassView()
    }
}
