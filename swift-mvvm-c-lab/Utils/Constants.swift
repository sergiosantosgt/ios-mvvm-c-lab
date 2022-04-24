//
//  Constants.swift
//  swift-mvvm-c-lab
//
//  Created by Sergio Santos on 13/04/22.
//

import Foundation
import UIKit

enum Constants {
    // MARK: - Colors
    static let mainColor = UIColor(red: 0x71 / 0xFF, green: 0xBC / 0xFF, blue: 0xBD / 0xFF, alpha: 1)
    static let secondaryColor = UIColor.gray
    static let lightColor = UIColor.lightGray
    
    // MARK: - Messages
    static let authFailTitle: String = "Falha ao autenticar"
    static let authFailMsg: String = "Falha ao realizar a autenticação, por favor, tente novamente."
    static let registerFailTitle: String = "Falha ao cadastrar"
    static let checkField: String = "Verifique o campo"
    static let registerValidationFailMsg: String = "Não foi possível prosseguir com o cadastro."
    static let registerFailMsg: String = "Falha ao realizar o cadastro, verifique os campos e tente novamente."
    static let registerSuccessMsg: String = "Cadastro realizado com sucesso."
    static let cancelMsg: String = "Cancelar"
    static let loginTitle: String = "Login"
    static let registerTitle: String = "Cadastro"
    static let proceedMsg: String = "Prosseguir"
}
