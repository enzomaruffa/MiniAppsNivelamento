//
//  OrdenacaoView.swift
//  ExerciciosNivelamento
//
//  Created by Enzo Maruffa Moreira on 08/05/21.
//

import SwiftUI

struct OrdenacaoView: View {
    
    let minValue = 0
    let maxValue = 99
    
    var totalArrayValues: Int {
        Int.random(in: 5...7)
    }
    
    let allowRepeated = false
    
    @State private var originalArray: [Int] = [1, 2, 3]
    @State private var sortedArray: [Int] = [1, 2, 3]
    
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
                                        .foregroundColor(.white)
                                        .bold()
                                }
                                .padding()
                                .frame(width: 65, height: 65)
                                .background(Color(.displayP3, white: 0.1, opacity: 1))
                                .cornerRadius(12)
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
                                        .foregroundColor(.white)
                                        .bold()
                                }
                                .padding()
                                .frame(width: 65, height: 65)
                                .background(Color(.displayP3, white: 0.1, opacity: 1))
                                .cornerRadius(12)
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
        sortedArray = array.sorted()
    }
}

struct OrdenacaoView_Previews: PreviewProvider {
    static var previews: some View {
        OrdenacaoView()
    }
}
