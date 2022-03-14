//
//  ComTableViewCell.swift
//  Translationsarah
//
//  Created by sarah hemood  on 28/07/1443 AH.
//

import UIKit

class ComTableViewCell: UITableViewCell {

    @IBOutlet weak var ImgBackground: UIView!
    @IBOutlet weak var backgroudview1: UIView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var tybe: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var iimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
            iimage.applyshadowWithCorner(containerView: ImgBackground, cornerRadious: 30)
          
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        iimage.layer.cornerRadius = 30
        backgroudview1.layer.cornerRadius = 12
        backgroudview1.layer.shadowRadius = 0.2
        backgroudview1.layer.shadowOpacity = 1
        backgroudview1.layer.shadowOffset = .zero
//        CGSize (width:0, height: 3)
        backgroudview1.layer.shadowColor = UIColor.gray.cgColor
        
    }
    

}


