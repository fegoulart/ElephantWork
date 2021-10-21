//
//  CelulaCustomizada.swift
//  ElephantsWork
//
//  Created by Jackeline Pires de Lima on 20/10/21.
//

import UIKit

class CelulaCustomizada: UICollectionViewCell {
    
    //MARK: IBOutlet
    @IBOutlet weak var labelNome: UILabel!
    
    @IBOutlet weak var imageElephants: UIImageView!
    //variavel estatica
    static var idCell = "celulaCustomizada"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
