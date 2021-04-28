import SwiftUI

struct GastoDoFumanteView: View {
    
    @State private var yearsSmoking: String = ""
    @State private var cigarreteCount: String = ""
    @State private var packPrice: String = ""
    @State private var totalCost: String = "Preencha os campos acima!"
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .center) {
                Text("Gasto do Fumante")
                    .font(.largeTitle)
                    .bold()
                HStack {
                    Text("Anos fumando:")
                        .bold()
                        .frame(minWidth: 140, alignment: .trailing)
                    NumericTextField(
                        title: "Quantos anos fumando?",
                        text: $yearsSmoking,
                        value: yearsSmoking,
                        action: updateCost
                    )
                }
                HStack {
                    Text("Cigarros por dia:")
                        .bold()
                        .frame(minWidth: 140, alignment: .trailing)
                    NumericTextField(
                        title: "Quantos cigarros por dia?",
                        text: $cigarreteCount,
                        value: cigarreteCount,
                        action: updateCost
                    )
                }
                HStack {
                    Text("Preço do maço:")
                        .bold()
                        .frame(minWidth: 140, alignment: .trailing)
                    NumericTextField(
                        title: "Qual o preço?",
                        text: $packPrice,
                        value: packPrice,
                        action: updateCost
                    )
                }
                Spacer()
                Text("\(totalCost)")
                    .bold()
            }
        }
        .padding()
    }

    private func updateCost<T: Equatable>(_ : T) {
        guard let yearsSmoking = Int(self.yearsSmoking),
              let cigarreteCount = Int(self.cigarreteCount),
              let packPrice = Float(self.packPrice)
        else {
            totalCost = "Preencha todos os campos!"
            return
        }
        
        let totalCoast = gastoDoFumante(
            anosFumando: yearsSmoking,
            nCigarrosPorDia: cigarreteCount,
            precoDaCarteira: packPrice
        )
        
        self.totalCost = "Foram gastos \(totalCoast) em fumaça!"
    }
}

struct GastoDoFumanteView_Previews: PreviewProvider {
    static var previews: some View {
        GastoDoFumanteView()
    }
}
