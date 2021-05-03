//
//  ExerciciosView.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 29/03/21.
//

import SwiftUI

struct ExerciciosView: View {
    let categoria: Categoria

    var exercicios: [Exercicio] {
        categoria.exercicios
    }
    
    var body: some View {
        List(exercicios, id: \.nome) { exercicio in
            NavigationLink(
                destination: ExercicioView(exercicio: exercicio),
                label: {
                    Text(exercicio.nome)
                })
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(categoria.nome)
    }
}

struct ExerciciosView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciciosView(categoria: Exercicios.shared.categorias.first!)
    }
}
