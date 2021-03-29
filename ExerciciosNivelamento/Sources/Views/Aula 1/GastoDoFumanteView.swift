import SwiftUI

struct GastoDoFumanteView: View {
    
    @State private var yearsSmoking: String = ""
    @State private var cigarreteCount: String = ""
    @State private var packPrice: String = ""
    @State private var totalCoast: String = "Preencha os campos acima"
    
    var body: some View {
        VStack {
            NumericTextField(
                title: "Quantos anos fumando",
                text: $yearsSmoking,
                value: yearsSmoking,
                action: updateCoast
            )
            
            NumericTextField(
                title: "Quantos cigarros fumados por dia",
                text: $cigarreteCount,
                value: cigarreteCount,
                action: updateCoast
            )
            NumericTextField(
                title: "Preco do maco",
                text: $packPrice,
                value: packPrice,
                action: updateCoast
            )
            Text("\(totalCoast)")
        }
        .padding()
    }

    private func updateCoast<T: Equatable>(_ : T) {
        guard let yearsSmoking = Int(self.yearsSmoking),
              let cigarreteCount = Int(self.cigarreteCount),
              let packPrice = Float(self.packPrice)
        else {
            totalCoast = "Preencha todos os campos com numeros (use ponto para a virgula)"
            return
        }
        
        let totalCoast = gastoDoFumante(
            anosFumando: yearsSmoking,
            nCigarrosPorDia: cigarreteCount,
            precoDaCarteira: packPrice
        )
        
        self.totalCoast = "Foram gastos \(totalCoast) em fumaça"
    }
}
