//
//  TranslatorTableViewCell.swift
//  Mobeen
//
//  Created by Manal Alangari on 28/02/2022.
//

import UIKit

class TranslatorTableViewCell: UITableViewCell {

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var imgTranslator: UIImageView!
    @IBOutlet weak var lblTransName: UILabel!
    @IBOutlet weak var imgStar: UIImageView!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblDescr: UILabel!
    @IBOutlet weak var btnRequest: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var lblExpress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnRequest.setTitle("Request".loca, for: .normal)

    }
    
    func setupCell(photo: UIImage, name: String, rate: String, description: String) {
        imgTranslator.image = photo
        lblTransName.text = name
        lblRate.text = rate
        lblDescr.text = description
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        imgTranslator.layer.cornerRadius = 30
        card.layer.cornerRadius = 12
        card.layer.shadowColor = UIColor.gray.cgColor
        card.layer.shadowOpacity = 1
        card.layer.shadowOffset = .zero
        card.layer.shadowRadius = 0.2
        
    }
}

