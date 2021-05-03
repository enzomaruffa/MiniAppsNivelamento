/// # Aula 3
/// Faça suas resoluções da Aula 3 aqui!

import Foundation

func tomperos(temFeijao: Bool, temArroz: Bool, temBatata: Bool) -> (azeite: Bool, sal: Bool,
                                                                    pimenta: Bool, oregano: Bool) {
        var vaiSal = false
        var vaiPimenta = false
        var vaiAzeite = false
        var vaiOregano = false
        
        if temFeijao && !temArroz && !temBatata {
            vaiSal = true
        }
        if temArroz && !temFeijao && !temBatata {
            vaiPimenta = true
        }
        if temBatata {
            vaiAzeite = true
        }
        if temArroz && temFeijao && !temBatata {
            vaiSal = false
            vaiPimenta = false
            vaiAzeite = false
            vaiOregano = false
        }
        if temArroz && temFeijao && temBatata {
            vaiSal = true
            vaiPimenta = true
            vaiAzeite = true
        }
        
        if (temBatata || (temFeijao && temArroz)) && !(temBatata && temFeijao && temArroz) {
            vaiOregano = true
        }
        
        print("Vai azeite: \(vaiAzeite ? "sim" : "não").")
        print("Vai sal: \(vaiSal ? "sim" : "não").")
        print("Vai pimenta: \(vaiPimenta ? "sim" : "não").")
        print("Vai oregano: \(vaiOregano ? "sim" : "não").")
    return (azeite: vaiAzeite, sal: vaiSal, pimenta: vaiPimenta, oregano: vaiOregano)
}
