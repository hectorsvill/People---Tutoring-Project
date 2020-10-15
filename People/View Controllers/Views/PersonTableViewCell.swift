//
//  PersonTableViewCell.swift
//  People
//
//  Created by Hector Villasano on 10/14/20.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    var person: Person? {
        didSet {
            configureViews()
        }
    }
    
    
    @IBOutlet weak var PersonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    private func configureViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        
    }
    
    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
        print("Heart button pressed")
    }
    
}
