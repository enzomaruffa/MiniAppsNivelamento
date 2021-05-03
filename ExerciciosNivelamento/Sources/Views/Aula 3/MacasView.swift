//
//  MacasView.swift
//  ExerciciosNivelamento
//
//  Created by Vinícius Binder on 03/05/21.
//

import SwiftUI

struct MacasView: View {
    @State private var nApples = 0
    @State private var appleScale: CGFloat = 1.0 {
        didSet {
            if appleScale != 1.0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    appleScale = 1.0
                }
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Image(systemName: "applelogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .overlay(Text(String(nApples)).font(.largeTitle).bold().foregroundColor(.white).offset(x: 0, y: 16))
                    .scaleEffect(appleScale)
                    .animation(.easeInOut(duration: 0.1))
                
                Spacer()
                HStack(spacing: 10) {
                    Button {
                        nApples += 1
                        appleScale = 1.2
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.green)
                            .frame(width: 44, height: 44)
                    }
                    
                    Button {
                        nApples -= 1
                        appleScale = 0.8
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                    }
                    .disabled(nApples <= 0)
                    .opacity(nApples <= 0 ? 0.5 : 1)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.vertical).padding(.bottom)
            
            Divider()
            HStack {
                Image(systemName: "dollarsign.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.yellow)
                    .frame(width: 44, height: 44)
                Text(String(format: "%.2f", ExerciciosNivelamento.precoDeMacas(n: nApples)))
                    .font(.title)
                    .bold()
            }
            
            Spacer()
        }
        .padding()
    }
}

struct MacasView_Previews: PreviewProvider {
    static var previews: some View {
        MacasView()
    }
}
