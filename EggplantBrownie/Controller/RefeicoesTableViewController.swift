//
//  RefeicoesTableViewController.swift
//  EggplantBrownie
//
//  Created by Gabriel de Castro Chaves on 04/07/22.
//


import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Macarrao", felicidade: 5),
                     Refeicao(nome: "Churros", felicidade: 4),
                     Refeicao(nome: "Pizza", felicidade: 3)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        cell.textLabel?.text = refeicao.nome
        return cell
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let  viewController = segue.destination as? AdicionaRefeicaoViewController    {
            viewController.delegate = self
        }
    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
}
