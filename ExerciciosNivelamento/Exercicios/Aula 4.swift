/// # Aula 4
/// Faça suas resoluções da Aula 4 aqui!

import Foundation

/// Descobre se o fazendeiro precisa avisar uma ovelha ou espantar o lobo
/// - Parameter animais: Lista de string com os animais ("wolf" ou "sheep")
/// - Returns: Mensagem para o fazendeiro.
func avisaOvelhas(animais: [String]) -> String {
    return "Mensagem"
}

/// Calcula uma pirâmide de quantos níveis é possível montar.
/// - Parameter bolas: Quantidade de bolas.
/// - Returns: Níveis da pirâmide.
func nivelDePiramide(paraBolas bolas: Int) -> Int {
    0
}


/// Descobre se um número inteiro é primo.
/// - Parameter n: O número a ser verificado.
/// - Returns: Se é primo.
func ehPrimo(_ n: Int) -> Bool {
    if n <= 1 { return false }
    else if n <= 3 { return true }
    
    let sqrt = Int(Double(n).squareRoot())
    for i in 2...sqrt {
        if n.isMultiple(of: i) {
            return false
        }
    }
    
    return true
}
