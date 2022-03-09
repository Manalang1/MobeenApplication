//
//  PayViewController.swift
//  Translationsarah
//
//  Created by sarah hemood  on 28/07/1443 AH.
//

import UIKit

class PayViewController: UIViewController {

    @IBOutlet weak var cash: UILabel!
    @IBOutlet weak var credit: UILabel!
    @IBOutlet weak var apple: UILabel!
    @IBOutlet weak var payment: UILabel!
    @IBOutlet weak var tree: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var feb: UILabel!
    @IBOutlet weak var data: UILabel!
    @IBOutlet weak var omar: UILabel!
    @IBOutlet weak var translator: UILabel!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var service: UILabel!
    @IBOutlet weak var Requestno: UILabel!
    @IBOutlet weak var pay: UIButton!
    @IBOutlet weak var Cancel: UIButton!
    override func viewDidLoad() {
        title = "Order details"
        super.viewDidLoad()
        Cancel.layer.cornerRadius = 15
        pay.layer.cornerRadius = 15
        self.title = "tttttt"
        Requestno.text = "Request No. 123456".lociz
        service.text = "Service type:" .lociz
        text.text = "Text translation"
//        translator.text = NSLocalizedString(, comment: <#T##String#>)
    }
    

    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: false, completion: nil)
        
      
    }
    
}



