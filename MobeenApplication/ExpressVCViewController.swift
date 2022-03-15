//
//  ExpressVCViewController.swift
//  Mobeen
//
//  Created by Manal Alangari on 04/03/2022.
//

import UIKit

class ExpressVCViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var TableExpress: UITableView!
    
    var expressArr :[Translator] = []
    //var setExpressArr :[Translator] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableExpress.delegate = self
        TableExpress.dataSource = self
        print(expressArr.count)
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expressArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableExpress.dequeueReusableCell(withIdentifier: "translatorCell") as! TranslatorTableViewCell
        let infoo = expressArr[indexPath.row]
        cell.lblExpress.text = "Express".loca
        cell.setupCell(photo: infoo.photo, name: infoo.name, rate: infoo.rate, description: infoo.descreption)
        return cell

    }
}
