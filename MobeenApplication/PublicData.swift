//
//  PersonData.swift
//  TableViewApp
//
//  Created by Raghad Alhassan on 04/08/1443 AH.
//

import UIKit

class PublicData {
  static let people: [Person] = [
        .init(
            name: NSLocalizedString("Mohammead", comment: ""),
            review: NSLocalizedString("His work is great and very accurate.", comment: ""),
            numberValues: 4.84,
            image: UIImage(named: "photo1")!
        ),
        .init(
            name: NSLocalizedString("Noura Saad", comment: ""),
            review: NSLocalizedString("Good", comment: "") ,
            numberValues: 3.33,
            image: UIImage(named: "photo1")!
        ),
        .init(
            name: NSLocalizedString("Sara", comment: ""),
            review: NSLocalizedString("Great work.", comment: ""),
            numberValues:4.90,
            image: UIImage(named: "photo2")!
        )
        
    ]
}
