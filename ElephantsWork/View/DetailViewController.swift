//
//  DetailViewController.swift
//  ElephantsWork
//
//  Created by Jackeline Pires de Lima on 20/10/21.
//

import UIKit

class DetailViewController: UITableViewCell {
    
    //UIImage
    //name
    //specie
    //sex
    //note
    //botao

    @IBOutlet weak var imageDetails: UIImageView!
    @IBOutlet weak var nameElephant: UILabel!
    @IBOutlet weak var specie: UILabel!
    @IBOutlet weak var sexElephant: UILabel!
    @IBOutlet weak var noteElephant: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//    }
    
}
