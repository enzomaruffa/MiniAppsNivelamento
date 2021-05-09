//
//  ExercicioView.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 29/03/21.
//

import SwiftUI

struct ExercicioView: View {
    let exercicio: Exercicio
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .center) {
                Text(exercicio.nome)
                    .font(.largeTitle)
                    .bold()
                exercicio.view
            }
        }
        .padding()
        .navigationTitle(exercicio.nome)
    }
}

struct ExercicioView_Previews: PreviewProvider {
    static var previews: some View {
        ExercicioView(exercicio: Exercicios.shared.categorias.first!.exercicios.first!)
    }
}
