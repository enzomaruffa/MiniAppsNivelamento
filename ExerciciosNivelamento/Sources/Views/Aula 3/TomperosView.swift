//
//  TomperosView.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 03/05/21.
//

import SwiftUI

struct TomperosView: View {
    @State var feijao: Bool = false
    @State var arroz: Bool = false
    @State var batata: Bool = false
    
    @State var vaiAzeite: Bool = false
    @State var vaiSal: Bool = false
    @State var vaiPimenta: Bool = false
    @State var vaiOregano: Bool = false
    
    var body: some View {
        Spacer()
        VStack(alignment: .center) {
            HStack {
                Button(action: {
                    feijao.toggle()
                    evaluate()
                }) {
                    VStack(alignment: .center) {
                        Image("feijao")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(feijao ? 1 : 0.8)
                            .animation(.easeInOut(duration: 0.15))
                        Text("Feijão")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(feijao ? .green : Color.gray)
                .cornerRadius(16)
                .animation(.easeInOut(duration: 0.15))
                
                Button(action: {
                    arroz.toggle()
                    evaluate()
                }) {
                    VStack(alignment: .center) {
                        Image("arroz")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(arroz ? 1 : 0.8)
                            .animation(.easeInOut(duration: 0.15))
                        Text("Arroz")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(arroz ? .green : Color.gray)
                .cornerRadius(16)
                .animation(.easeInOut(duration: 0.15))
                
                Button(action: {
                    batata.toggle()
                    evaluate()
                }) {
                    VStack(alignment: .center) {
                        Image("batata")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(batata ? 1 : 0.8)
                            .animation(.easeInOut(duration: 0.15))
                        Text("Batata")
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(batata ? .green : Color.gray)
                .cornerRadius(16)
                .animation(.easeInOut(duration: 0.15))
            }
            Spacer()
            VStack {
                HStack {
                    VStack(alignment: .center) {
                        Image("azeite")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(vaiAzeite ? 1 : 0.8)
                            .animation(.easeInOut(duration: 0.15))
                        Text("Azeite")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(vaiAzeite ? .green : Color.red)
                    .cornerRadius(16)
                    .animation(.easeInOut(duration: 0.15))
                    
                    VStack(alignment: .center) {
                        Image("sal")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(vaiSal ? 1 : 0.8)
                            .animation(.easeInOut(duration: 0.15))
                        Text("Sal")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(vaiSal ? .green : Color.red)
                    .cornerRadius(16)
                    .animation(.easeInOut(duration: 0.15))
                }
                
                HStack {
                    VStack(alignment: .center) {
                        Image("pimenta")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(vaiPimenta ? 1 : 0.8)
                            .animation(.easeInOut(duration: 0.15))
                        Text("Pimenta")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(vaiPimenta ? .green : Color.red)
                    .cornerRadius(16)
                    .animation(.easeInOut(duration: 0.15))
                    
                    VStack(alignment: .center) {
                        Image("oregano")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(vaiOregano ? 1 : 0.8)
                            .animation(.easeInOut(duration: 0.15))
                        Text("Orégano")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(vaiOregano ? .green : Color.red)
                    .cornerRadius(16)
                    .animation(.easeInOut(duration: 0.15))
                }
            }
        }
        .padding()
        Spacer()
    }
    
    func evaluate() {
        let results = ExerciciosNivelamento.tomperos(temFeijao: feijao, temArroz: arroz, temBatata: batata)
        self.vaiAzeite = results.azeite
        self.vaiSal = results.sal
        self.vaiPimenta = results.pimenta
        self.vaiOregano = results.oregano
    }
}

struct TomperosView_Previews: PreviewProvider {
    static var previews: some View {
        TomperosView()
    }
}
