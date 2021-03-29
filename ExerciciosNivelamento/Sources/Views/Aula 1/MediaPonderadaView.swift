import SwiftUI

struct MediaPonderadaView: View {
    @State private var nota1: String = ""
    @State private var nota2: String = ""
    @State private var nota3: String = ""
    
    @State private var peso1: String = ""
    @State private var peso2: String = ""
    @State private var peso3: String = ""
    
    @State private var average: String = ""
    
    var body: some View {
        VStack {
            NumericTextField(
                title: "Nota 1", text: $nota1,
                value: nota1, action: handleChange)
            NumericTextField(
                title: "Nota 2", text: $nota2,
                value: nota2, action: handleChange)
            NumericTextField(
                title: "Nota 3", text: $nota3,
                value: nota3, action: handleChange)
            NumericTextField(
                title: "Peso 1", text: $peso1,
                value: peso1, action: handleChange)
            NumericTextField(
                title: "Peso 2", text: $peso2,
                value: peso2, action: handleChange)
            NumericTextField(
                title: "Peso 3", text: $peso3,
                value: peso3, action: handleChange)
            Text(average)
        }.padding()
    }
    
    private func handleChange<T>(_: T) {
        guard let n1 = Float(nota1),
              let n2 = Float(nota2),
              let n3 = Float(nota3),
              let p1 = Float(peso1),
              let p2 = Float(peso2),
              let p3 = Float(peso3)
        else {
            average = "Preencha todos os campos com numeros menores do que 10"
            return
        }
        let average = mediaPonderada(
            nota1: n1,
            peso1: p1,
            nota2: n2,
            peso2: p2,
            nota3: n3,
            peso3: p3
        )
        self.average = "\(average)"
    }
}
