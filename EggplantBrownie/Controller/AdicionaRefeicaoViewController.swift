//
//  ViewController.swift
//  EggplantBrownie
//
//  Created by Gabriel de Castro Chaves on 04/07/22.
//
protocol AdicionaRefeicaoDelegate: AnyObject {
    func add(_ refeicao: Refeicao)
}

import UIKit

final class AdicionaRefeicaoViewController: UIViewController, AdicionaItemDelegate {
    
    //MARK: Vars
    var itens: [Item] = [Item(nome: "Cebola", calorias: 210),
                         Item(nome: "Queijo", calorias: 230)]
    var itensSelecionados: [Item] = []
    weak var delegate: AdicionaRefeicaoDelegate?
    
    
    //MARK: View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var felicidadeTextField: UITextField!
    
    @IBAction func addButton(_ sender: UIButton) {
        guard let nome = nomeTextField.text, let felicidade = felicidadeTextField.text, let felicidadeInt = Int(felicidade) else {return}
        let refeicao = Refeicao(nome: nome, felicidade: felicidadeInt, item: itensSelecionados)
        delegate?.add(refeicao)
        print("metodo executado")
        
    }
    
    func addItem(_ item: Item) {
        itens.append(item)
        tableView.reloadData()
    }
    
    @objc func exibeAlerta(_ gesture: UIGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            if let indexPath = tableView.indexPath(for: celula) {
                let item = itens[indexPath.row]
                print("\(item.nome)")
                Alerta(self).show(title: "\(item.nome)", message: "Sua quantidade de calorias é \(item.calorias)")
            }
    }
}
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as? AdicionaItemViewController
        viewController?.delegate = self
    }
}

    //MARK: UITableViewDelegate
extension AdicionaRefeicaoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
}

    //MARK: UITableViewDataSource
extension AdicionaRefeicaoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let nomeDoItem = itens[indexPath.row].nome
        cell.textLabel?.text = "\(nomeDoItem)"
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(exibeAlerta))
        //longPress.state = .began
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        let itemSelecionado = itens[indexPath.row]
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            itensSelecionados.append(itemSelecionado)
        } else {
            cell.accessoryType = .none
            if let position = itensSelecionados.firstIndex(of: itemSelecionado) {
                itensSelecionados.remove(at: position)
            }
        }
        for index in itensSelecionados {
            print(index.nome)
            print(itensSelecionados.count)
        }
    }
}

