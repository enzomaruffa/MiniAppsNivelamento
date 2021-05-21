//
//  JornalView.swift
//  ExerciciosNivelamento
//
//  Created by Vinícius Binder on 03/05/21.
//

import SwiftUI

struct JornalView: View {
    @State private var selectedNewscaster = ""
    @State private var shownLogo = ""
    
    let newscasters = ["Pinheiro", "Araújo", "Coutinho", "Bonner", "Vasconcellos", "Pelajo"]
    
    let logos = [
        "Bom Dia Brasil": "bom-dia-brasil",
        "Jornal Hoje": "jornal-hoje",
        "Jornal Nacional": "jornal-nacional",
        "Jornal da Globo": "jornal-da-globo",
    ]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                ScrollViewReader { value in
                    LazyHStack(spacing: 0) {
                        ForEach(newscasters, id: \.self) { newscaster in
                            VStack {
                                Spacer()
                                Image(newscaster)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                Spacer()
                                Text(newscaster)
                                    .foregroundColor(.white)
                                    .bold()
                                Spacer()
                            }
                            .frame(width: 140, height: 200)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .scaleEffect(newscaster == selectedNewscaster ? 1 : 0.8)
                            .animation(.easeInOut(duration: 0.2))
                            .id(newscaster)
                            .onTapGesture {
                                withAnimation {
                                    value.scrollTo(newscaster, anchor: .center)
                                }
                                selectNewscaster(newscaster)
                            }
                        }
                    }
                }
            }
            .frame(height: 200)
            
            if !shownLogo.isEmpty {
                Text("Apresenta")
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 50)
                Image(shownLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(20)
                    .transition(.opacity)
            }
            
            Spacer()
        }
    }
    
    private func selectNewscaster(_ newscaster: String) {
        selectedNewscaster = newscaster
        let jornal = ExerciciosNivelamento.jornalParaApresentador(deSobrenome: newscaster)
        shownLogo = logos[jornal] ?? ""
    }
}

struct JornalView_Previews: PreviewProvider {
    static var previews: some View {
        JornalView()
    }
}
