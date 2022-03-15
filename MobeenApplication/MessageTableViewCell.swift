//
//  MessageTableViewCell.swift
//  MessageApp
//
//  Created by Raghad Alhassan on 01/08/1443 AH.
//

import UIKit

class MessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var MessageBackgroundView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    var trailingConstraint: NSLayoutConstraint!
    var leadingConstraint: NSLayoutConstraint!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        messageLabel.text = nil
        leadingConstraint.isActive = false
        trailingConstraint.isActive = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateMessageCell(bt message: MessageData){

        trailingConstraint = MessageBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        leadingConstraint = MessageBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        messageLabel.text = message.text
  
        MessageBackgroundView.layer.masksToBounds = true
        
      if message.isFirstUser{

            messageLabel.textAlignment = .right
            
        }else{
            MessageBackgroundView.backgroundColor = UIColor(red: 232/255.0, green: 238/255.0, blue: 250/255.0, alpha: 1.0)
            
            leadingConstraint.isActive = true
            messageLabel.textAlignment = .left
        }
 
    }
}
