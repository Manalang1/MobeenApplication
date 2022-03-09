//
//  CompViewController.swift
//  Translationsarah
//
//  Created by sarah hemood  on 28/07/1443 AH.
//

import UIKit

class CompViewController: UIViewController{
    
    var Completed :[Item] = [
        Item ( name :NSLocalizedString("Mohammed Ahmad", comment: "")  , image : "image5",tybe :NSLocalizedString("Translation", comment: ""),status : NSLocalizedString("Completed", comment: "")) ,
        Item ( name : NSLocalizedString("Omar Saad", comment: "") , image : "image6",tybe :NSLocalizedString("Conversion", comment: ""),status : NSLocalizedString("Completed", comment: "")),
        Item ( name : NSLocalizedString("Saleh Alomar" , comment: ""), image : "image7",tybe :NSLocalizedString("Translation", comment: ""),status : NSLocalizedString("Completed", comment: "")),
        Item ( name : NSLocalizedString("Googan", comment: "") , image : "image8",tybe :NSLocalizedString("Translation", comment: ""),status : NSLocalizedString("Completed", comment: ""))
    ]
    var filteredCompleted = [Item]()

    @IBOutlet weak var Requesttr: UIButton!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var completedOutlet: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        completedOutlet.titleLabel?.textColor =  UIColor(red: 59/255, green:130/255, blue: 247/255, alpha: 1)
//        tableview.separatorStyle = .none
        filteredCompleted = Completed
        tableview.delegate = self
        tableview.dataSource = self
        searchBar.delegate = self
        completedOutlet.setTitle(NSLocalizedString("Completed", comment:"") , for: .normal)
        Requesttr.setTitle(NSLocalizedString("Requests", comment: ""), for: .normal)
        searchBar.placeholder = NSLocalizedString("search", comment: "")
    }


    @IBAction func request(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}


extension CompViewController : UISearchBarDelegate {

    // Search Bar
    // 3
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredCompleted = Completed.filter({ Completed -> Bool in
            if searchText.isEmpty { return true }
                return Completed.name.lowercased().contains(searchText.lowercased())

        })
        tableview.reloadData()
    }
}

extension CompViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCompleted.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "comp", for: indexPath) as! ComTableViewCell
        cell.name.text = filteredCompleted[indexPath.row].name
        cell.tybe.text = filteredCompleted[indexPath.row].tybe
        cell.status.text = filteredCompleted[indexPath.row].status
        cell.iimage.image = UIImage(named: filteredCompleted[indexPath.row].image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
        
    }
}

