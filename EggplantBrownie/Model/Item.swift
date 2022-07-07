//
//  Item.swift
//  EggplantBrownie
//
//  Created by Gabriel de Castro Chaves on 04/07/22.
//

import UIKit

class Item: NSObject {
    
    var nome: String
    var calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
}
