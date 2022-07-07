//
//  AdicionaItemViewController.swift
//  EggplantBrownie
//
//  Created by Gabriel de Castro Chaves on 05/07/22.
//

protocol AdicionaItemDelegate: AnyObject {
    func addItem(_ item: Item)
}

import UIKit

class AdicionaItemViewController: UIViewController {
    
    weak var delegate: AdicionaItemDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBOutlet weak var nomeItemTextField: UITextField!
    @IBOutlet weak var caloriasItemTextField: UITextField!
    
    @IBAction func addItem(_ sender: UIButton) {
        guard let nome = nomeItemTextField.text, let calorias = caloriasItemTextField.text, let caloriasDouble = Double(calorias) else {return}
        let item = Item(nome: nome, calorias: caloriasDouble)
        delegate?.addItem(item)
        limpaTextFields()
        navigationController?.popViewController(animated: true)
    }
    
    func limpaTextFields() {
        nomeItemTextField.text = ""
        caloriasItemTextField.text = ""
    }
}
