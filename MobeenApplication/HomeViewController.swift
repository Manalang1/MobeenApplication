//
//  HomeViewController.swift
//  TableViewApp
//
//  Created by Raghad Alhassan on 25/07/1443 AH.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate , UITableViewDataSource {
    
    
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var backg: UIView!
    @IBOutlet weak var btRequest: UIButton!
    @IBOutlet weak var lableAli: UILabel!
    @IBOutlet weak var labletext: UILabel!
    @IBOutlet weak var labletext2: UILabel!
    @IBOutlet weak var labletext3: UILabel!
    @IBOutlet weak var labletext4: UILabel!
    @IBOutlet weak var labletext5: UILabel!
    @IBOutlet weak var labletext6: UILabel!
    @IBOutlet weak var labletext7: UILabel!
    @IBOutlet weak var labletext8: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        btRequest.setTitle(NSLocalizedString("Request",comment: "" ), for: .normal)
        lableAli.text = NSLocalizedString("Ali Ahmed", comment: "")
        labletext.text = NSLocalizedString("Translator and Editor (English - Arabic) Bachelor’s Degree - Language and Translation", comment: "")
        labletext2.text = NSLocalizedString("King Saud University", comment: "")
        labletext3.text = NSLocalizedString("Riyadh, Saudi Arabia", comment: "")
        labletext4.text = NSLocalizedString("Qualifications", comment: "")
        labletext5.text = NSLocalizedString("4.84", comment: "")
        labletext6.text = NSLocalizedString("posted this.2w", comment: "")
        labletext7.text = NSLocalizedString("posted this.2w", comment: "")
        labletext8.text = NSLocalizedString("Review", comment: "")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PublicData.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTableViewCell
        let data = PublicData.people[indexPath.row]
        cell.setupCell(photo: data.image, name: data.name, review: data.review, numbervalues: data.numberValues)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
}

