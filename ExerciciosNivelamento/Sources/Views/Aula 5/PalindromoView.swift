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
    
    func decidePalindromo(frase: String) {
        palindromo = ExerciciosNivelamento.palindromo(frase: frase)
    }
    
    var body: some View { 
        VStack(alignment: .center) {
            Text("É palíndromo?")
            TextField("Coloque a frase aqui!", text: $frase)
                .onChange(of: frase) {
                    decidePalindromo(frase: $0)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
            if palindromo {
                Text("Sim!!!")
                    .foregroundColor(.green)
            } else {
                Text("Não!!!")
                    .foregroundColor(.red)
            }
        }
    }
}

struct PalindromoView_Previews: PreviewProvider {
    static var previews: some View {
        PalindromoView()
    }
}
