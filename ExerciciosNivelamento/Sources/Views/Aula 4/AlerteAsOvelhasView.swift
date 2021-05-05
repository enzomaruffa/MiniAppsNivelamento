//
//  AlerteAsOvelhasView.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 05/05/21.
//

import SwiftUI

struct AlerteAsOvelhasView: View {
    
    @State var animals: [String] = []
    @State var message: String = "Aguardando uma configuração!"
    
    let minSheep = 2
    let maxSheep = 6
    
    var body: some View {
        Spacer()
        ZStack(alignment: .center) {
            Image("farm-bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack(alignment: .center) {
                Spacer()
                VStack {
                    Text(message)
                        .foregroundColor(.black)
                        .bold()
                }
                .padding()
                .background(Color.white)
                Spacer()
                HStack(alignment: .center) {
                    ForEach(animals, id: \.self) { animal in
                        Image(animal)
                            .resizable()
                            .frame(maxWidth: 26, maxHeight: 19)
                    }
                    Image("farmer")
                        .resizable()
                        .frame(maxWidth: 11, maxHeight: 19)
                }
                Spacer()
                Button(action: {
                    generateConfig()
                }, label: {
                    VStack {
                        Text("Gerar!")
                            .foregroundColor(.black)
                            .bold()
                    }
                    .padding()
                    .background(Color.white)
                })
                Spacer()
            }
        }
        Spacer()
    }
    
    func generateConfig() {
        let sheepCount = Int.random(in: minSheep...maxSheep)
        let wolfPosition = Int.random(in: 0...sheepCount)
        
        animals = (0...(sheepCount))
                    .map({ $0 == wolfPosition ? "wolf" : "sheep" })
        
        message = ExerciciosNivelamento.avisaOvelhas(animais: animals)
    }
}

struct AlerteAsOvelhasView_Previews: PreviewProvider {
    static var previews: some View {
        AlerteAsOvelhasView()
    }
}
