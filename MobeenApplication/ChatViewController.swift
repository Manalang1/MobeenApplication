//
//  ChatViewController.swift
//  MessageApp
//
//  Created by Raghad Alhassan on 03/08/1443 AH.
//

import UIKit

class ChatViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var ChatView: UITableView!
    @IBOutlet weak var MsgTextFeild: UITextField!
    @IBOutlet weak var imgaali: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ChatView.delegate = self
        ChatView.dataSource = self
        MsgTextFeild.layer.cornerRadius = 30
        ChatView.layer.cornerRadius = 18
        
        imgaali.text = NSLocalizedString("Ali Ahmed" , comment: "")
        
    }
    
    var messages: [MessageData] =
    [MessageData(text: NSLocalizedString("   Hello", comment: ""), isFirstUser: false),]
    
    var isFirstUser: Bool = true
    
    @IBAction func SendMessageButton(_ sender: UIButton) {
        guard let textFromField = MsgTextFeild.text else {return}
        if  textFromField != "" {
            messages.append(MessageData(text: textFromField, isFirstUser: isFirstUser))
            ChatView.beginUpdates()
            ChatView.insertRows(at: [IndexPath.init(row: messages.count - 1 , section: 0)], with: .fade)
            ChatView.endUpdates()
            //  isFirstUser = !isFirstUser
            MsgTextFeild.text = nil
        }
        
    }
    
    //TableViewDelegates
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let msg = messages[indexPath.row]
        
        if msg.isFirstUser == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell" , for: indexPath) as! MessageTableViewCell
            
            cell.updateMessageCell(bt: messages[indexPath.row])
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCellSender" , for: indexPath) as! MessageTableViewCell
            
            cell.updateMessageCell(bt: messages[indexPath.row])
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
}
