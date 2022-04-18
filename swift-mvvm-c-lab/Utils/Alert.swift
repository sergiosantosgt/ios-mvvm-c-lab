//
//  Alert.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 18/04/22.
//

import UIKit


class Alert {
    
    var titulo: String
    var mensagem: String
    
    init(titulo: String, mensagem: String) {
        self.titulo = titulo
        self.mensagem = mensagem
    }
    
    func getAlert() -> UIAlertController {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let  acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(acaoCancelar)
        return alerta
    }
}
