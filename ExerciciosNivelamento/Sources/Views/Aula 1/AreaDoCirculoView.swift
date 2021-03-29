import SwiftUI

struct AreaDoCirculoView: View {
    
    @State private var radius: String = ""
    @State private var circleArea: String = ""
    
    var body: some View {
        VStack {
            NumericTextField(
                title: "Área do círculo",
                text: $radius,
                value: radius,
                action: updateRadius
            )
            Text(circleArea)
        }.padding()
    }
    
    private func updateRadius<T: Equatable>(_ :T) {
        guard let radius = Float(self.radius)
        else {
            circleArea = "Preencha todos os campos com numeros (use ponto para a virgula)"
            return
        }
        let circleArea: Float = areaDoCirculo(raio: radius)
        self.circleArea = "Area do ciculo: \(circleArea)"
    }
}
