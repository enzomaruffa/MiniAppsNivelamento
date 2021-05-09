//
//  PalindromoView.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 29/03/21.
//

import SwiftUI

struct PalindromoView: View {
    @State private var frase: String = ""
    @State private var palindromo: Bool = true
    @State private var showResult: Bool = false
    
    func decidePalindromo(frase: String) {
        showResult = frase != ""
        palindromo = ExerciciosNivelamento.palindromo(frase: frase)
    }
    
    var body: some View {
        Spacer()
        VStack(alignment: .center) {
            TextField("Frase", text: $frase)
                .onChange(of: frase) {
                    decidePalindromo(frase: $0)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            Spacer()
            
            HStack(alignment: .bottom) {
                if showResult {
                    Text(palindromo ? "👍" : "👎")
                        .font(.largeTitle)
                        .animation(.easeInOut(duration: 0.15))
                }
                VStack(alignment: .center) {
                    Text(showResult ? "A frase é palíndromo?" : "Aguardando frase...")
                        .bold()
                    if showResult {
                        Text(palindromo ? "Sim!" : "Não...")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(palindromo ? .green : .red)
                            .animation(.easeInOut(duration: 0.15))
                    }
                }
                if showResult {
                    Text(palindromo ? "👍" : "👎")
                        .font(.largeTitle)
                        .animation(.easeInOut(duration: 0.15))
                }
            }
            
        }
    }
}

struct PalindromoView_Previews: PreviewProvider {
    static var previews: some View {
        PalindromoView()
    }
}

