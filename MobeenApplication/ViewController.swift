//
//  ViewController.swift
//  MobeenApplication
//
//  Created by Manal Alangari on 09/03/2022.
//



import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var header: UIImageView!
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnST: UIButton!
    @IBOutlet weak var btnCO: UIButton!
    var arrTranslator: [Translator] = [
        Translator(name: NSLocalizedString("Ali Ahmed", comment: ""), rate: "4.94", descreption: "Translator and Editor (English - Arabic) has a Bachelor’s Degree in Language and Translation", photo: UIImage(named: "m5")!, isLeftSideContent: true, isExpress: true)
        ,
        Translator(name: "Omar Saad", rate: "4.30", descreption: "Translator and Editor (English - Arabic) has a Bachelor’s Degree in Language and Translation", photo: UIImage(named: "m1")!, isLeftSideContent: true, isExpress: false)
        ,
        Translator(name: "Mohammed Ali", rate: "4.74", descreption: "Translator and Editor (English - Arabic) has a Bachelor’s Degree in Language and Translation", photo: UIImage(named: "m3")!, isLeftSideContent: true, isExpress: true)
        ,
        Translator(name: "Sara Abdullah", rate: "4.94", descreption: "Translator and Editor (English - Arabic) has a Bachelor’s Degree in Language and Translation", photo: UIImage(named: "w2")!, isLeftSideContent: true, isExpress: true)
        ,
        Translator(name: "Noura Rashed", rate: "4.14", descreption: "Translator and Editor (English - Arabic) has a Bachelor’s Degree in Language and Translation", photo: UIImage(named: "w1")!, isLeftSideContent: true, isExpress: false)
        ,
        Translator(name: "Torjoman", rate: "4.50", descreption: "Torjoman is a leading translation agency that", photo: UIImage(named: "o1")!, isLeftSideContent: false, isExpress: true)
        ,
        Translator(name: "Saleh Alomar", rate: "4.20", descreption: "Saleh Alomar certifid translation aims", photo: UIImage(named: "o2")!, isLeftSideContent: false, isExpress: true)
        ,
        Translator(name: "Googan", rate: "4.84", descreption: "Certified translation section fastst", photo: UIImage(named: "o3")!, isLeftSideContent: false, isExpress: false)
        ,
        Translator(name: "TransOrient", rate: "4.00", descreption: "TransOrient translation office is an ambitious establishment", photo: UIImage(named: "o4")!, isLeftSideContent: false, isExpress: false)
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewCard.layer.cornerRadius = 12
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSelectingLeftSide {
            let leftContentArr = arrTranslator.filter({ $0.isLeftSideContent == true })
            return leftContentArr.count
        } else {
            let rightContentArr = arrTranslator.filter({ $0.isLeftSideContent == false })
            return rightContentArr.count
        }
        
    }
    var isSelectingLeftSide = true
    var isServiceExpress = true
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "translatorCell") as! TranslatorTableViewCell
        
        if arrTranslator[indexPath.row].isExpress {
            cell.lblExpress.text = "Express"
      } else {
          cell.lblExpress.text = ""
      }
        if isSelectingLeftSide {
            let leftContentArr = arrTranslator.filter({ $0.isLeftSideContent == true })
            let data = leftContentArr[indexPath.row]
            cell.setupCell(photo: data.photo, name: data.name, rate: data.rate, description: data.descreption)
            cell.btnSave.tag = indexPath.row
            
            cell.btnSave.addTarget(self, action: #selector(addToSaved(sender:)), for: .touchUpInside)
            return cell
        } else {
            let rightContentArr = arrTranslator.filter({ $0.isLeftSideContent == false })
            let data = rightContentArr[indexPath.row]
            cell.setupCell(photo: data.photo, name: data.name, rate: data.rate, description: data.descreption)
            cell.btnSave.tag = indexPath.row
            cell.btnSave.addTarget(self, action: #selector(addToSaved(sender:)), for: .touchUpInside)
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell index = \(indexPath.row)")
    }
    
    @objc
    func addToSaved(sender: UIButton){
        print("button index = \(sender.tag)")
        sender.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
}
    
    @IBAction func btnTranslator(_ sender: UIButton) {
     isSelectingLeftSide = true
        btnST.setTitleColor(UIColor(red: 59/255, green: 130/255, blue: 247/255, alpha: 1), for: .normal)
        btnCO.setTitleColor(.gray, for: .normal)
        tableView.reloadData()
        
        
    }
    @IBAction func btnOffices(_ sender: UIButton) {
        isSelectingLeftSide = false
        btnST.setTitleColor(.gray, for: .normal)
        btnCO.setTitleColor(UIColor(red: 59/255, green: 130/255, blue: 247/255, alpha: 1), for: .normal)
        tableView.reloadData()
    
    }

    @IBAction func btnExpress(_ sender: UIButton) {
        performSegue(withIdentifier: "goToExpress", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToExpress" {

            let vc = segue.destination as! ExpressVCViewController
            let ExpressArr = arrTranslator.filter({ $0.isExpress == true })
            vc.expressArr = ExpressArr
            
        }
    }
}
struct Translator {
    let name : String
    let rate : String
    let descreption : String
    let photo : UIImage
    let isLeftSideContent: Bool
    let isExpress: Bool
}


