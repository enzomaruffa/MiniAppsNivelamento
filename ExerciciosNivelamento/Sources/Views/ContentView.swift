//
//  ContentView.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 29/03/21.
//

import SwiftUI

struct ContentView: View {
    let categorias: [Categoria]
    
    var body: some View {
        NavigationView {
            List(categorias, id: \.nome) { categoria in
                NavigationLink(
                    destination: ExerciciosView(categoria: categoria),
                    label: {
                        Text(categoria.nome)
                    })
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Aulas")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(categorias: Exercicios.shared.categorias)
    }
}
