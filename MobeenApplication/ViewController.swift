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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnST: UIButton!
    @IBOutlet weak var btnCO: UIButton!
    @IBOutlet weak var btnEx: UIButton!
    @IBOutlet weak var BarSearch: UISearchBar!
    var arrTranslator: [Translator] = [
        Translator(name: NSLocalizedString("Ali Ahmed", comment: ""), rate: "4.94".loca, descreption: "Translator and Editor (English - Arabic) has a Bachelor’s Degree in Language and Translation".loca, photo: UIImage(named: "m5")!, isLeftSideContent: true, isExpress: true)
        ,
        Translator(name: "Omar Saad".loca, rate: "4.30".loca, descreption: "Translator and Editor (English - Arabic) has a Bachelor’s Degree in Language and Translation".loca, photo: UIImage(named: "m1")!, isLeftSideContent: true, isExpress: false)
        ,
        Translator(name: "Mohammed Ali".loca, rate: "4.74".loca, descreption: "Translator and Editor (English - Arabic) has a Bachelor’s Degree in Language and Translation".loca, photo: UIImage(named: "m3")!, isLeftSideContent: true, isExpress: true)
        ,
        Translator(name: "Sara Abdullah".loca, rate: "4.94".loca, descreption: "Translator and Editor (English - Arabic) has a Bachelor’s Degree in Language and Translation".loca, photo: UIImage(named: "w2")!, isLeftSideContent: true, isExpress: true)
        ,
        Translator(name: "Noura Rashed".loca, rate: "4.14".loca, descreption: "Translator and Editor (English - Arabic) has a Bachelor’s Degree in Language and Translation".loca, photo: UIImage(named: "w1")!, isLeftSideContent: true, isExpress: false)
        ,
        Translator(name: "Torjoman".loca, rate: "4.50".loca, descreption: "Torjoman is a leading translation agency that".loca, photo: UIImage(named: "o1")!, isLeftSideContent: false, isExpress: true)
        ,
        Translator(name: "Saleh Alomar".loca, rate: "4.20".loca, descreption: "Saleh Alomar certifid translation aims".loca, photo: UIImage(named: "o2")!, isLeftSideContent: false, isExpress: true)
        ,
        Translator(name: "Googan".loca, rate: "4.84".loca, descreption: "Certified translation section fastst".loca, photo: UIImage(named: "o3")!, isLeftSideContent: false, isExpress: false)
        ,
        Translator(name: "TransOrient".loca, rate: "4.00".loca, descreption: "TransOrient translation office is an ambitious establishment".loca, photo: UIImage(named: "o4")!, isLeftSideContent: false, isExpress: false)
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        viewCard.layer.cornerRadius = 12
        lblHeader.text = "Always there to help you in translation".loca
        btnST.setTitle("Specialized Translators".loca, for: .normal)
        btnCO.setTitle("Certified Offices".loca, for: .normal)
        btnEx.setTitle("Express".loca, for: .normal)
        BarSearch.placeholder = "Search".loca
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the Navigation Bar
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
//    var isServiceExpress = true
    
    
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
       // performSegue(withIdentifier: "goToExpress", sender: nil)
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "GoExpress") as! ExpressVCViewController
        
         let ExpressArr = arrTranslator.filter({ $0.isExpress == true })
        vc.expressArr = ExpressArr
        
        navigationController?.pushViewController(vc, animated: true)
        
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

extension String {
    var loca: String {
        return NSLocalizedString(self, comment: "")
    }
}
//Manal


