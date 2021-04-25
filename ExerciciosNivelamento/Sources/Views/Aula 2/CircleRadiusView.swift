//
//  CircleRadiusView.swift
//  ExerciciosNivelamento
//
//  Created by Vinícius Binder on 25/04/21.
//

import SwiftUI

struct CircleRadiusView: View {
    
    @State private var area: String = ""
    @State private var radius: (real: CGFloat, visual: CGFloat) = (0, 0)
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Raio de um círculo")
                .font(.largeTitle)
                .bold()
            VStack(alignment: .leading) {
                HStack {
                    Text("Área: ")
                    NumericTextField(title: "Entre com uma área (menor que 100).", text: $area, value: area, action: handleChange)
                }
                Text("Raio:   " + String(format: "%.2f", radius.real))
                    .foregroundColor(.red)
                    .bold()
            }
            CircleWithSemiLine(radius: radius.visual)
                .stroke()
                .foregroundColor(.red)
                .padding(.vertical)
        }
        .padding()
    }
    
    private func handleChange<T>(_: T) {
        guard let area = Double(area) else { return }
        let visualRadius = CGFloat(ExerciciosNivelamento.radiusForCircle(ofArea: area * 1000))
        if visualRadius < UIScreen.main.bounds.width/2 - 10 {
            let realRadius = CGFloat(ExerciciosNivelamento.radiusForCircle(ofArea: area))
            self.radius = (realRadius, visualRadius)
        }
    }
}

struct CircleRadiusView_Previews: PreviewProvider {
    static var previews: some View {
        CircleRadiusView()
    }
}
