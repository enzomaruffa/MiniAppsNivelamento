import SwiftUI

struct AreaDoCirculoView: View {
    
    @State private var area: CGFloat = 0
    @State private var radius: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Área de um círculo")
                .font(.largeTitle)
                .bold()
            VStack(alignment: .leading) {
                HStack {
                    Text("Raio: ")
                    NumericTextField(title: "Entre com um raio (menor que 100).",
                                     text: $radius,
                                     value: radius,
                                     action: handleChange)
                }
                Text("Área:   " + String(format: "%.2f", area))
                    .foregroundColor(.red)
                    .bold()
            }
            CircleWithSemiLine(radius: area / 10)
                .fill()
                .foregroundColor(.red)
                .padding(.vertical)
        }
        .padding()
    }
    
    private func handleChange<T>(_: T) {
        guard let radius = Double(radius) else { return }
        self.area = CGFloat(ExerciciosNivelamento.areaDoCirculo(raio: radius))
    }
}
