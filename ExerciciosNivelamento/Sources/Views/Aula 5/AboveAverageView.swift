//
//  AboveAverageView.swift
//  ExerciciosNivelamento
//
//  Created by Vinícius Binder on 10/05/21.
//

import SwiftUI

struct AboveAverageView: View {
    @State private var students: [(name: String, score: Double)] = [
        ("Cruella de Vil", 4),
        ("Gil do Vigor", 9),
        ("Mickey Mouse", 5),
    ]
    
    private var aboveAverageStudents: [String] {
        ExerciciosNivelamento.acimaDaMedia2(notas: students.map { $0.score }, estudantes: students.map { $0.name })
    }
    
    @State private var isShowingAddSheet = false
    
    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.name) { student in
                    HStack {
                        Text(student.name)
                        Spacer()
                        if aboveAverageStudents.contains(student.name) {
                            Text(String(format: "%.2f", student.score))
                                .foregroundColor(.green)
                            Image(systemName: "arrow.up.square.fill")
                                .foregroundColor(.green)
                                .font(.title2)
                        } else {
                            Text(String(format: "%.2f", student.score))
                                .foregroundColor(.red)
                            Image(systemName: "arrow.down.square.fill")
                                .foregroundColor(.red)
                                .font(.title2)
                        }
                    }
                }
            }
            Button {
                isShowingAddSheet = true
            } label: {
                HStack {
                    Image(systemName: "plus")
                        .font(.title2.weight(.semibold))
                    Text("Adicionar estudante")
                        .bold()
                }
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                .frame(height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .sheet(isPresented: $isShowingAddSheet) {
                AboveAverageAddView(students: $students)
            }
        }
    }
}

struct AboveAverageView_Previews: PreviewProvider {
    static var previews: some View {
        AboveAverageView()
    }
}

struct AboveAverageAddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var students: [(name: String, score: Double)]
    
    @State private var name = ""
    @State private var score = ""
    @State private var scoreDouble = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Nome", text: $name)
                    NumericTextField(title: "Nota", text: $score, value: score, action: handleChange)
                }
                Spacer()
                Button {
                    students.append((name, scoreDouble))
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Adicionar")
                        .bold()
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .frame(height: 50)
                        .background(Color.pink)
                        .cornerRadius(10)
                        .padding(.horizontal).padding(.horizontal).padding(.bottom)
                }
            }
            .navigationBarTitle("Novo estudante", displayMode: .inline)
            .navigationBarItems(leading: Button { presentationMode.wrappedValue.dismiss() } label: { Text("Cancel") })
        }
    }
    
    private func handleChange<T>(_: T) {
        guard let score = Double(score) else { return }
        scoreDouble = score
    }
}
