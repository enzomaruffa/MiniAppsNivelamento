//
//  OrdenacaoView.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 08/05/21.
//

import SwiftUI

struct OrdenacaoView: View {
    
    let minValue = 0
    let maxValue = 10
    
    var totalArrayValues: Int {
        Int.random(in: 4...6)
    }
    
    let allowRepeated = true
    
    @State private var originalArray: [Int] = [1, 2, 3]
    @State private var sortedArray: [Int] = [1, 2, 3]
    
    @State private var selectedInt: Int? = nil
    
    var body: some View {
        Spacer()
        VStack(alignment: .center) {
            
            VStack(alignment: .leading) {
                Text("Vetor original")
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { value in
                        HStack(spacing: 10) {
                            ForEach(originalArray, id: \.self) { n in
                                VStack() {
                                    Text("\(n)")
                                        .foregroundColor(
                                            (selectedInt ?? n + 1) == n ? .blue : .white
                                        )
                                        .bold()
                                }
                                .frame(minWidth: 60, minHeight: 60)
                                .background(Color(.displayP3,
                                                  white: (selectedInt ?? n + 1) == n ? 0.9 : 0.1,
                                                  opacity: 1))
                                .cornerRadius(12)
                                .scaleEffect((selectedInt ?? n + 1) == n ? 1 : 0.9)
                                .animation(.easeInOut(duration: 0.15))
                                .onTapGesture {
                                    if let selectedInt = selectedInt,
                                       selectedInt == n {
                                        self.selectedInt = nil
                                    } else {
                                        selectedInt = n
                                    }
                                }
                            }
                        }
                    }
                }
//                .frame(height: 200)
                
                Text("Vetor ordenado")
                ScrollView(.horizontal, showsIndicators: false) {
                    ScrollViewReader { value in
                        HStack(spacing: 10) {
                            ForEach(sortedArray, id: \.self) { n in
                                VStack() {
                                    Text("\(n)")
                                        .foregroundColor(
                                            (selectedInt ?? n + 1) == n ? .blue : .white
                                        )
                                        .bold()
                                }
                                .frame(minWidth: 60, minHeight: 60)
                                .background(Color(.displayP3,
                                                  white: (selectedInt ?? n + 1) == n ? 0.85 : 0.1,
                                                  opacity: 1))
                                .cornerRadius(12)
                                .scaleEffect((selectedInt ?? n + 1) == n ? 1 : 0.9)
                                .animation(.easeInOut(duration: 0.15))
                                .onTapGesture {
                                    if let selectedInt = selectedInt,
                                       selectedInt == n {
                                        self.selectedInt = nil
                                    } else {
                                        selectedInt = n
                                    }
                                }
                            }
                        }
                    }
                }
//                .frame(height: 200)
            }
            
            Spacer()
            Button {
                generateArray()
            } label: {
                Text("Gerar novo vetor!")
                    .foregroundColor(.black)
                    .bold()
                    .padding()
                    .background(Color(.displayP3, white: 0.8, opacity: 1))
                    .cornerRadius(12)
                    .shadow(color: .gray, radius: 4, x: 0, y: 1)
            }
        }
    }
    
    func generateArray() {
        let count = totalArrayValues
        var array = [Int]()
        
        while array.count < count {
            let value = Int.random(in: minValue...maxValue)
            
            if (allowRepeated || !array.contains(value)) {
                array.append(value)
            }
        }
        
        originalArray = array
        sortedArray = ExerciciosNivelamento.ordenar(numeros: array)
    }
}

struct OrdenacaoView_Previews: PreviewProvider {
    static var previews: some View {
        OrdenacaoView()
    }
}
