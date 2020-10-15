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
    
    var heartImage: UIImage {
        UIImage.fetchFavoriteUIImage(person!.isFavorite)
    }
    
    private func configureViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        heartButton.setImage(heartImage, for: .normal)
        
    }
    
    @IBAction func heartButtonPressed(_ sender: UIButton) {
        person?.isFavorite.toggle()
        heartButton.setImage(heartImage, for: .normal)
    }
    
}
