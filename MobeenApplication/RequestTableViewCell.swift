//
//  RequestTableViewCell.swift
//  Translationsarah
//
//  Created by sarah hemood  on 28/07/1443 AH.
//

import UIKit

// 1 -
protocol ShowScreen: AnyObject {
    // 2
    func showVC(_ cell: UITableViewCell)
}

class RequestTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroudview: UIView!
    
    @IBOutlet weak var ImgBackground: UIView!
    @IBOutlet weak var view1: UIButton!
    @IBOutlet weak var Massage: UIButton!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tybe: UILabel!
    @IBOutlet weak var iimage: UIImageView!
    @IBOutlet weak var status: UILabel!
    

    
    // 3
    weak var delegate: ShowScreen?

    func viewDidLoad(){

    }
    override func awakeFromNib() {
        super.awakeFromNib()
        view1.setTitle(NSLocalizedString("view", comment: ""), for: .normal)
        Massage.setTitle(NSLocalizedString("Massage", comment:"") , for: .normal)
//        Massage.titleLabel.
        iimage.applyshadowWithCorner(containerView: ImgBackground, cornerRadious: 30)
      
           Massage.layer.cornerRadius = 4
        backgroudview.layer.cornerRadius = 12
        backgroudview.layer.shadowRadius = 0.2
        backgroudview.layer.shadowOpacity = 1
        backgroudview.layer.shadowOffset = .zero
//        CGSize (width:0, height: 3)
        backgroudview.layer.shadowColor = UIColor.gray.cgColor
       
       
        
    }
 
   
    @IBAction func view(_ sender: Any) {
        // 4
        self.delegate?.showVC(self)
       
    }
    
    @IBAction func massage(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }

}
//        iimage.layer.cornerRadius = 15
//        iimage.clipsToBounds = false
//        iimage.layer.cornerRadius = iimage.frame.width / 2.0
//
//        iimage.layer.shadowColor = UIColor.black.cgColor
//        iimage.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
//        iimage.layer.cornerRadius = 30.0
//        iimage.layer.shadowOpacity = 0.4
//
////        iimage.layer.shadowOffset = CGSize.zero
////        iimage.clipsToBounds = false
//        iimage.layer.shadowRadius = 10
//        iimage.layer.shadowOpacity = 1
////        iimage.layer.cornerRadius = iimage.frame.width / 2
//        iimage.layer.shadowColor = UIColor.black.cgColor
//        iimage.layer.borderWidth = 2.0
//
//        iimage.clipsToBounds = false
//        iimage.layer.cornerRadius = 30
//
//        iimage.layer.shadowOpacity = 1
////        iimage.layer.shadowOffset = CGSize.zero
//        iimage.layer.shadowRadius = 10
////        iimage.layer.shadowOffset = CGSize (width: 30, height: 30)
//        iimage.layer.shadowPath = UIBezierPath(roundedRect: iimage.bounds, cornerRadius: 30).cgPath
//        self.clipsToBounds = true
//        self.layer.cornerRadius = 30
//
//        iimage.layer.shadowRadius = 40
//        iimage.layer.shadowOpacity = 2
//        iimage.layer.shadowOffset = CGSize (width: 30, height: 30)
//        iimage.layer.shadowColor = UIColor.red.cgColor
//        iimage.layer.masksToBounds = false
//        iimage.clipsToBounds = true
//
//        iimage.layer.shadowColor = UIColor.black.cgColor
//        iimage.layer.shadowOffset = CGSize(width: 100.0, height: 100.0)
//        iimage.layer.shadowRadius = 25.0
//        iimage.layer.shadowOpacity = 0.9

