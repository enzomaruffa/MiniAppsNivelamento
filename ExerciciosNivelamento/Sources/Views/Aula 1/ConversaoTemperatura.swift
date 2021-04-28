//
//  ConversaoTemperatura.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 28/04/21.
//

import SwiftUI

struct ConversaoTemperaturaView: View {
    @State var fahrenheit: String = ""
    @State var celsius: Double? = nil
    
    
    var body: some View {
        HStack(alignment: .top) {
            NumericTextField(title: "Fahrenheit",
                 text: $fahrenheit,
                 value: fahrenheit,
                 action: handleFahrenheitChange)
                .frame(alignment: .center)
            Text("=")
                .font(.title2)
                .bold()
            Text("\(celsius != nil ? "\(celsius!)" : "?")C")
                .font(.title2)
                .bold()
        }
        Spacer()
    }
    
    private func handleFahrenheitChange<T: Equatable>(_ : T) {
        guard let fahrenheit = Double(fahrenheit) else { return }
        let celsius = ExerciciosNivelamento.converteTemperatura(temperaturaF: fahrenheit)
        self.celsius = celsius
    }
}

struct ConversaoTemperaturaView_Previews: PreviewProvider {
    static var previews: some View {
        ConversaoTemperaturaView()
    }
}
