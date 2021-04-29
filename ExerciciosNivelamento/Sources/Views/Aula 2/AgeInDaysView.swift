//
//  AgeInDAysView.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 29/04/21.
//

import SwiftUI

struct AgeInDaysView: View {
    @State var years = ""
    @State var months = ""
    @State var days = ""
    
    @State var total: Int = 0
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack(alignment: .center) {
                HStack(alignment: .center) {
                    Text("Anos:")
                        .bold()
                    NumericTextField(title: "Anos", text: $years, value: years, action: handleChange)
                }
                HStack(alignment: .center) {
                    Text("Meses:")
                        .bold()
                    NumericTextField(title: "Meses", text: $months, value: months, action: handleChange)
                }
                HStack(alignment: .center) {
                    Text("Dias:")
                        .bold()
                    NumericTextField(title: "Dias", text: $days, value: days, action: handleChange)
                }
            }
            Text("Total: \(total) dias")
                .bold()
            Spacer()
        }
    }
    
    private func handleChange<T>(_: T) {
        let years = Int(years) ?? 0
        let months = Int(months) ?? 0
        let days = Int(days) ?? 0
        total = ExerciciosNivelamento.idadeEmDias(anos: years, meses: months, dias: days)
    }
}

struct AgeInDaysView_Previews: PreviewProvider {
    static var previews: some View {
        AgeInDaysView()
    }
}
