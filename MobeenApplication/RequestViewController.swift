//
//  RequestViewController.swift
//  MobeenApplication
//
//  Created by sarah hemood  on 06/08/1443 AH.
//

import UIKit

class RequestViewController: UIViewController{
    
    
    
    var requests: [Item] = [
        Item ( name : NSLocalizedString("Ali Ahmad", comment:"") , image : "image1",tybe :NSLocalizedString("Translation", comment: ""),status : NSLocalizedString("Accepted", comment: "")) ,
        Item ( name : NSLocalizedString("Torjman", comment: "") , image : "image2",tybe :NSLocalizedString("Translation", comment: ""),status : NSLocalizedString("Canceled", comment: "")),
        Item ( name : NSLocalizedString("Sara Abdullah" , comment: ""), image : "image3",tybe :NSLocalizedString("Translation", comment: ""),status : NSLocalizedString("Pending", comment: "")),
        Item ( name : NSLocalizedString("Nourah Rashed", comment: "") , image : "image4",tybe :NSLocalizedString("Conversion", comment: ""),status : NSLocalizedString("Canceled", comment: ""))
    ]
    // 1
    var filteredRequests = [Item]()
    
    
    @IBOutlet weak var completedtr: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var requestOutlet: UIButton!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestOutlet.titleLabel?.textColor =
        UIColor(red: 59/255, green:130/255, blue: 247/255, alpha: 1)
        searchBar.placeholder = NSLocalizedString("search", comment: "")
        filteredRequests = requests
        tableview.delegate = self
        tableview.dataSource = self
        searchBar.delegate = self
        requestOutlet.setTitle(NSLocalizedString("Requests", comment:"") , for: .normal)
        completedtr.setTitle(NSLocalizedString("Completed", comment:"") , for: .normal)
    }
    
    //    @IBAction func selectedComplete(_ sender: UIButton) {
    ////        comletebut.backgroundColor = .blue
    ////        requests.backgroundColor = .green
    //        sender.backgroundColor = .green
    
    
    @IBAction func completed(_ sender: Any) {
        performSegue(withIdentifier: "goToCompleted", sender: self)
        
    }
    
    @IBAction func viewbutton(_ sender: Any) {
        
        //   performSegue(withIdentifier: "Gotopay", sender: self)
    }
    
    
}

extension RequestViewController : UISearchBarDelegate {
    
    // Search Bar
    // 3
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredRequests = requests.filter({ request -> Bool in
            if searchText.isEmpty { return true }
            return request.name.lowercased().contains(searchText.lowercased())
            
        })
        tableview.reloadData()
    }
}
extension RequestViewController:UITableViewDelegate,UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "request", for: indexPath) as! RequestTableViewCell
        cell.delegate = self
        //        iimage.layer.borderWidth = 2.0
        
        //        cell.layer.borderWidth = 2.0
        cell.name.text = filteredRequests[indexPath.row].name
        cell.iimage.image = UIImage(named: filteredRequests[indexPath.row].image)
        cell.tybe.text = filteredRequests[indexPath.row].tybe
        cell.status.text = filteredRequests[indexPath.row].status
        
        
        
        
        
        
        switch cell.status.text {
            
        case "Accepted".lociz:
            cell.status.textColor =   UIColor(red: 0/255, green:100/255, blue: 0/255, alpha: 1)
        case "Pending".lociz:
            cell.status.textColor = .orange
        case "Canceled".lociz:
            cell.status.textColor = .red
        default:
            print("wrong")
            
            
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        170
    }
    
}
extension RequestViewController : ShowScreen {
    func showVC(_ cell: UITableViewCell) {
        guard let indexPath = tableview.indexPath(for: cell) else {return}
        if requests[indexPath.row].status == "Accepted".lociz {
            performSegue(withIdentifier: "Gotopay", sender: nil)
        }
    }
    
    
}

extension String {
    var lociz: String {
        return NSLocalizedString(self, comment: "")
    }
}
