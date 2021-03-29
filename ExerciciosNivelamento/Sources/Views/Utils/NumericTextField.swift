import SwiftUI

struct NumericTextField<V: Equatable>: View {
    
    let title: String
    let text: Binding<String>
    let value: V
    let action: (V) -> Void
    
    var body: some View {
        TextField(title, text: text)
            .onChange(of: value, perform: action)
            .keyboardType(.numberPad)
    }
}

