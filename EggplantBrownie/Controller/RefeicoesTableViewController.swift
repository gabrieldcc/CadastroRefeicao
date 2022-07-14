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
        setupTitle()
    }
    
    func setupTitle() {
        navigationItem.title = "Refeições"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func showAlert(_ gesture: UIGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath  = tableView.indexPath(for: celula) else {return}
            let refeicao = refeicoes[indexPath.row]
            Alerta(self).show(title: "\(refeicao.nome)", message: "O que deseja fazer com \(refeicao.nome)", handler: {
                alert in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
        }
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        cell.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showAlert(_:)))
        cell.addGestureRecognizer(longPress)
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
