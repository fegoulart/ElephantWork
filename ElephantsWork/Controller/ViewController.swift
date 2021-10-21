//
//  ViewController.swift
//  ElephantsWork
//
//  Created by Jackeline Pires de Lima on 20/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayDeElefantes : [Elephant] = []
    let api = API()
    
    //chama uma vez apenas, variavel computada
    lazy var elefanteCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //.horizontal
        
        //altura da celula
        let alturaCelula: CGFloat = (self.view.frame.height)/2.5 - 5
        layout.itemSize = CGSize(width: alturaCelula, height: alturaCelula)
        
        //lespaco minimo entre elemtnos da mesma linha
        layout.minimumInteritemSpacing = 40
        layout.minimumLineSpacing = 40
        
        //frame sera definido nos elasticos
        //collectioViewLayout é um flow layout é um fluxo
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //ATIVA CONSTRAINTS
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        //Ativar DataSource e o Delegate
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //vai tirar o indicador de scroll
        collectionView.showsHorizontalScrollIndicator = true
        
        return collectionView
    }()

    fileprivate func criaConstrainsCollectionView() {
        //colocar as constraints.
        NSLayoutConstraint.activate([
            elefanteCollectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            elefanteCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95),
            elefanteCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            elefanteCollectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        elefanteCollectionView.backgroundColor = .darkGray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGray
        
        //pega o XIB -> "CelulaCustomizada" vem do nome do arquivo do XIB
        let nibCelula = UINib(nibName: "CelulaCustomizada", bundle: nil)
        
        //CelulaCustomizada.idCell vem do nome do identificador criado na outra viewController
        elefanteCollectionView.register(nibCelula, forCellWithReuseIdentifier: CelulaCustomizada.idCell)
        
        //adiciona collectionView na telae?
        self.view.addSubview(elefanteCollectionView)
        
        criaConstrainsCollectionView()
        buscaElefantes()
    }
    
    func buscaElefantes(){
        api.getElephants { elefantes, error in
            if let elefantesRecebidos = elefantes {
                self.arrayDeElefantes = elefantesRecebidos
                
                //ERRO ROXO => erro de main thread , rodar na main thread
                DispatchQueue.main.async {
                    //atualiza a collection views
                    self.elefanteCollectionView.reloadData()
                }
            }
        }
    }
}

//MARK: Delegate

//nos avisa quando acontece
//quando seleciona uma celula
extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let elefanteVC = ElefanteViewController()
        //alimento a varivel da proxima view controller com a informacao que ela precisa
        elefanteVC.elefante = arrayDeElefantes[indexPath.row]
        
        self.present(elefanteVC, animated: true, completion: nil)
        
    }
}

//MARK: DataSource

//passa informacoes para collectionView, passa um retorno
extension ViewController: UICollectionViewDataSource {
    //retorna mais de uma sessao
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
    //pede numero de itens para a secao
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayDeElefantes.count
    }
    
    //qual celula vai colocar em cada um dos espacos
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //registra celula  // as! fala que ele é uma celula customizada
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CelulaCustomizada.idCell, for: indexPath) as! CelulaCustomizada
    
        let elefante = arrayDeElefantes[indexPath.row]
        
        cell.labelNome.text = elefante.name ?? "Sem nome"
        cell.layer.cornerRadius = 20.0
        
            if let urlString = elefante.image {
                if let url = URL(string: urlString) {
                    cell.imageElephants.load(url: url)
            }
        }
        
        return cell
    }
    
}

