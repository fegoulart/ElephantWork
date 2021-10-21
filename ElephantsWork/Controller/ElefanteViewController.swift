//
//  ElefanteViewController.swift
//  ElephantsWork
//
//  Created by Jackeline Pires de Lima on 20/10/21.
//

import UIKit

class ElefanteViewController: UIViewController {
    
    //criei uma variavel para ser alimentada pela ViewController anterior
    var elefante: Elephant?
    
    let labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome que vai entrar aqui"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.view.addSubview(labelName)
        
        NSLayoutConstraint.activate([
            labelName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            labelName.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        labelName.text = elefante?.name
    }
}
