//
//  Alerta.swift
//  EggplantBrownie
//
//  Created by Gabriel de Castro Chaves on 06/07/22.
//

import UIKit

class Alerta: NSObject {
    
    var controller: UIViewController
    
    init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    func show(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonDelete = UIAlertAction(title: "Deletar", style: .default, handler: nil)
        let buttonCancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alert.addAction(buttonDelete)
        alert.addAction(buttonCancel)
        controller.present(alert, animated: true, completion: nil)
    }
}



