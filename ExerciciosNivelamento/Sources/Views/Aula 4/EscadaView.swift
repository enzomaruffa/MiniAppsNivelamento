//
//  EscadaView.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 06/05/21.
//

import SwiftUI

struct EscadaView: View {
    @State private var levels = 0
    @State private var levelsHashCount = [Int]()
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .center) {
                Stepper("Qtde de degraus: \(levels)", value: $levels)
                    .onChange(of: levels) { value in
                        print(levels)
                        levelsHashCount = ExerciciosNivelamento.escadaDeHashtag(com: levels)
                        print(levelsHashCount)
                    }
            }
            
            VStack(alignment: .leading) {
                ForEach(levelsHashCount, id: \.self) { hashCount in
                    Text(String(Array(repeating: "#", count: hashCount)))
                }
            }
            Spacer()
        }
    }
}

struct EscadaView_Previews: PreviewProvider {
    static var previews: some View {
        EscadaView()
    }
}
