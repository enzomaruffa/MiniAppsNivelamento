//
//  IMCView.swift
//  ExerciciosNivelamento
//
//  Created by Vinícius Binder on 25/04/21.
//

import SwiftUI

struct IMCView: View {
    
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var imc: String = "Entre com um peso em kg e uma altura em m."
    
    var body: some View {
        HStack(alignment: .top) {
            Image("human-body")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text("IMC")
                    .font(.largeTitle)
                    .bold()
                NumericTextField(title: "Peso", text: $weight, value: weight, action: handleChange)
                NumericTextField(title: "Altura", text: $height, value: height, action: handleChange)
                Text(imc)
                    .lineLimit(nil)
                    .padding(.top)
            }
            .padding()
        }
        .padding()
    }
    
    private func handleChange<T>(_: T) {
        guard let weight = Double(weight), let height = Double(height) else {
            imc = "Entre com um peso em kg e uma altura em m."
            return
        }
        let result = ExerciciosNivelamento.imc(peso: weight, altura: height)
        imc = "IMC = " + String(format: "%.2f", result)
    }
}

struct IMCView_Previews: PreviewProvider {
    static var previews: some View {
        IMCView()
    }
}
