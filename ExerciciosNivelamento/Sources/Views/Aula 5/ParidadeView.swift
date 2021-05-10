//
//  ParidadeView.swift
//  ExerciciosNivelamento
//
//  Created by Vinícius Binder on 10/05/21.
//

import SwiftUI

struct ParidadeView: View {
    
    private let range = (min: 0, max: 10, allowRepeated: true)
    
    @State private var numbers: [Int] = []
    @State private var evenNumbers: [Int] = []
    @State private var oddNumbers: [Int] = []
    
    @State private var selectedNumber: Int? = nil
    @State private var numberArraySize = "6"
    
    var body: some View {
        VStack {
            HStack {
                scrollView(header: "Todos", array: numbers)
                scrollView(header: "Pares", array: evenNumbers)
                scrollView(header: "Ímpares", array: oddNumbers)
            }
            
            Spacer()
            
            HStack {
                Text("Tamanho: ")
                NumericTextField(title: "do vetor", text: $numberArraySize, value: numberArraySize, action: handleChange)
                    .font(.title3.bold())
                    .layoutPriority(-1)
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
        .padding(.top)
        .onAppear {
            generateArray()
        }
    }
    
    private func scrollView(header: String, array: [Int]) -> some View {
        VStack {
            Text(header)
                .bold()
            ScrollView(.vertical, showsIndicators: false) {
                ScrollViewReader { value in
                    VStack(spacing: 10) {
                        ForEach(array, id: \.self) { number in
                            VStack() {
                                Text("\(number)")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            .frame(minWidth: 60, minHeight: 60)
                            .background((selectedNumber ?? number + 1) == number ? Color.orange : Color.blue)
                            .cornerRadius(12)
                            .scaleEffect((selectedNumber ?? number + 1) == number ? 1 : 0.9)
                            .animation(.easeInOut(duration: 0.15))
                            .onTapGesture {
                                if let selectedNumber = selectedNumber,
                                   selectedNumber == number {
                                    self.selectedNumber = nil
                                } else {
                                    selectedNumber = number
                                }
                            }
                        }
                    }
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
    }
    
    private func handleChange<T>(_: T) {
        guard let _ = Int(numberArraySize) else {
            numberArraySize = "Número inteiro."
            return
        }
    }
    
    private func generateArray() {
        guard let size = Int(numberArraySize), size > 0 else { return }
        var array = [Int]()

        while array.count < size {
            let value = Int.random(in: range.min...range.max)

            if (range.allowRepeated || !array.contains(value)) {
                array.append(value)
            }
        }

        numbers = array
        let separation = ExerciciosNivelamento.separaParesImpares(numeros: numbers)
        evenNumbers = separation.pares
        oddNumbers = separation.impares
    }
}

struct ParidadeView_Previews: PreviewProvider {
    static var previews: some View {
        ParidadeView()
    }
}
