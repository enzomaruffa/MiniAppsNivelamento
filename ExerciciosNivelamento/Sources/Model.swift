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
    
    let categorias: [Categoria] = [
        Categoria(nome: "1. Constantes e Variáveis", exercicios: [
            Exercicio(nome: "Conversão de Temperatura", view: AnyView(ConversaoTemperaturaView())),
            Exercicio(nome: "Gasto do Fumante", view: AnyView(GastoDoFumanteView())),
            Exercicio(nome: "Área do Círculo", view: AnyView(AreaDoCirculoView())),
            Exercicio(nome: "Média Ponderada", view: AnyView(MediaPonderadaView())),
        ]),
        Categoria(nome: "2. Funções", exercicios: [
            Exercicio(nome: "IMC", view: AnyView(IMCView())),
            Exercicio(nome: "Raio de um Círculo", view: AnyView(CircleRadiusView())),
            Exercicio(nome: "Densidade do Mercúrio", view: AnyView(FishMassView())),
            Exercicio(nome: "Idade em dias", view: AnyView(AgeInDaysView())),
        ]),
        Categoria(nome: "3. Condicionais", exercicios: [
            Exercicio(nome: "Média Aritmética Simples", view: AnyView(MediaAritmeticaView())),
            Exercicio(nome: "Tômperos do Jacquin", view: AnyView(TomperosView())),
            Exercicio(nome: "Jornalistas", view: AnyView(JornalView())),
            Exercicio(nome: "Venda de Maçãs", view: AnyView(MacasView())),
        ]),
        Categoria(nome: "4. Laços", exercicios: [
            Exercicio(nome: "Escada de #", view: AnyView(EscadaView())),
            Exercicio(nome: "Pirâmide de Sinuca", view: AnyView(PiramideView())),
            Exercicio(nome: "É Primo?", view: AnyView(PrimoView())),
            Exercicio(nome: "Alerte as Ovelhas", view: AnyView(AlerteAsOvelhasView())),
        ]),
        Categoria(nome: "5. Vetores", exercicios: [
            Exercicio(nome: "Palíndromo", view: AnyView(PalindromoView())),
            Exercicio(nome: "Ordenação", view: AnyView(OrdenacaoView())),
            Exercicio(nome: "Pares x Ímpares", view: AnyView(ParidadeView())),
            Exercicio(nome: "Acima da média 2.0", view: AnyView(AboveAverageView())),
        ]),
        Categoria(nome: "6. Algoritmos", exercicios: [
        ])
    ]
    
    private init() {}
}
