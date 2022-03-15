//
//  HomeTableViewCell.swift
//  TableViewApp
//
//  Created by Raghad Alhassan on 25/07/1443 AH.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgPersonPhoto: UIImageView!
    @IBOutlet weak var lblPersonName: UILabel!
    @IBOutlet weak var lblPersonReview: UILabel!
    @IBOutlet weak var lblNumberValues: UILabel!
    @IBOutlet weak var imgStar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(photo: UIImage, name: String, review: String, numbervalues: Double){
        
        imgPersonPhoto.image = photo
        lblPersonName.text = name
        lblPersonReview.text = review
        lblNumberValues.text = "\(numbervalues)"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
