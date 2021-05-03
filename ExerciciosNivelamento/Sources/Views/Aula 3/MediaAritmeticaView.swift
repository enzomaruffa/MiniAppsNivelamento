//
//  MediaAritmeticaView.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 03/05/21.
//

import SwiftUI

struct MediaAritmeticaView: View {
    @State var nota1: String = ""
    @State var nota2: String = ""
    
    @State var resultado: String? = "Aguardando notas..."
    
    let aprovadoMessage = "aprovado!"
    let reprovadoMessage = "reprovado!"
    
    var showResult: Bool {
        resultado == aprovadoMessage || resultado == reprovadoMessage
    }
    
    var textColor: Color? {
        switch resultado {
        case aprovadoMessage: return .green
        case reprovadoMessage: return .red
        default: return nil
        }
    }
    
    var body: some View {
        Spacer()
        Divider()
        VStack(alignment: .center) {
            HStack(alignment: .top) {
                VStack(alignment: .center) {
                    Text("Nota 1")
                        .bold()
                    NumericTextField(title: "Nota", text: $nota1, value: nota1, action: handleChange)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                VStack(alignment: .center) {
                    Text("Nota 2")
                        .bold()
                    NumericTextField(title: "Nota", text: $nota2, value: nota2, action: handleChange)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                }
            }
            Spacer()
            HStack(alignment: .bottom) {
                if showResult {
                    Text(resultado == aprovadoMessage ? "👍" : "👎")
                        .font(.largeTitle)
                        .animation(.easeInOut(duration: 0.15))
                }
                VStack(alignment: .center) {
                    if showResult {
                        Text("O aluno foi...")
                            .bold()
                    }
                    Text(resultado ?? "")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(textColor)
                        .animation(.easeInOut(duration: 0.15))
                }
                if showResult {
                    Text(resultado == aprovadoMessage ? "👍" : "👎")
                        .font(.largeTitle)
                        .animation(.easeInOut(duration: 0.15))
                }
            }
        }
        Spacer()
    }
    
    private func handleChange<T>(_: T) {
        guard let n1 = Double(nota1),
              let n2 = Double(nota2)
        else {
            resultado = "Aguardando notas..."
            return
        }
        let aprovado = mediaAritmeticaSimples(nota1: n1, nota2: n2)
        resultado = aprovado ? aprovadoMessage : reprovadoMessage
    }
}

struct MediaAritmeticaView_Previews: PreviewProvider {
    static var previews: some View {
        MediaAritmeticaView()
    }
}
