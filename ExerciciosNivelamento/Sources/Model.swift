//
//  Model.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 29/03/21.
//

import SwiftUI

class Categoria {
    let nome: String
    
    // Cada categoria armazena os exercícios que ela apresentará
    let exercicios: [Exercicio]
    
    internal init(nome: String, exercicios: [Exercicio]) {
        self.nome = nome
        self.exercicios = exercicios
    }
}

class Exercicio {
    let nome: String
    
    // Refletindo sobre isso ainda. Com os links, podemos fazer um "header" nos exercícios com links externos.
    let linkNotion: String?
    let linkGithub: String?
    let linkGravacao: String?
    let linkCodewars: String?
    
    // Cada exercício possuí uma view do SwiftUI. Essa view pode agir como wrapper para outras coisas, como UIKit ou SpriteKit
    let view: AnyView
    
    var temItem: Bool {
        return (linkNotion != nil)
            || (linkGithub != nil)
            || (linkGravacao != nil)
            || (linkCodewars != nil)
    }
    
    internal init(nome: String, view: AnyView, linkNotion: String? = nil, linkGithub: String? = nil, linkGravacao: String? = nil, linkCodewars: String? = nil) {
        self.nome = nome
        self.linkNotion = linkNotion
        self.linkGithub = linkGithub
        self.linkGravacao = linkGravacao
        self.linkCodewars = linkCodewars
        self.view = view
    }
}

class Exercicios {
    static let shared = Exercicios()
    
    let categorias: [Categoria]
    
    private init() {
        
        categorias = [
            Categoria(nome: "1. Constantes e Variáveis", exercicios: [
                Exercicio(nome: "Gasto do Fumante", view: AnyView(GastoDoFumanteView())),
                Exercicio(nome: "Área do círculo", view: AnyView(AreaDoCirculoView())),
                Exercicio(nome: "Média Ponderada", view: AnyView(MediaPonderadaView())),
            ]),
            Categoria(nome: "2. Funções", exercicios: [
                Exercicio(nome: "IMC", view: AnyView(IMCView())),
                Exercicio(nome: "Raio de um círculo", view: AnyView(CircleRadiusView())),
                Exercicio(nome: "Densidade de mercúrio", view: AnyView(FishMassView())),
            ]),
            Categoria(nome: "3. Condicionais", exercicios: [
            ]),
            Categoria(nome: "4. Laços", exercicios: [
            ])
        ]
    }
}
