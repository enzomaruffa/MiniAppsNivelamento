import SwiftUI

struct GastoDoFumanteView: View {
    
    @State private var yearsSmoking: String = ""
    @State private var cigarreteCount: String = ""
    @State private var packPrice: String = ""
    @State private var totalCoast: String = ""
    
    var body: some View {
        VStack {
            TextField("Anos fumando", text: $yearsSmoking)
                .onChange(of: yearsSmoking, perform: updateCoast)
                .keyboardType(.numberPad)
            TextField("Quantos cigarros vc fuma por dia", text: $cigarreteCount)
                .onChange(of: cigarreteCount, perform: updateCoast)
                .keyboardType(.numberPad)
            TextField("Preco do maco", text: $packPrice)
                .onChange(of: packPrice, perform: updateCoast)
                .keyboardType(.numberPad)
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
