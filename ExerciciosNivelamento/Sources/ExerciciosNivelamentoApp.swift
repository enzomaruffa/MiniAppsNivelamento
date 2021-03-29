//
//  ExerciciosNivelamentoApp.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 29/03/21.
//

import SwiftUI

@main
struct ExerciciosNivelamentoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(categorias: Exercicios.shared.categorias)
        }
    }
}
