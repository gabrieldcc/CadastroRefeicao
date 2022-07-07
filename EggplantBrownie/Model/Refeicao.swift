//
//  Refeicoes.swift
//  EggplantBrownie
//
//  Created by Gabriel de Castro Chaves on 04/07/22.
//

import UIKit

class Refeicao: NSObject {
    
    let nome: String
    let felicidade: Int
    let item: [Item]
    
    init(nome: String, felicidade: Int, item: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
         self.item = item
    }
}
