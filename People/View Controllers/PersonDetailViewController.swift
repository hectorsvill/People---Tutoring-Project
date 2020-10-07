//
//  PersonDetailViewController.swift
//  People
//
//  Created by Hector Villasano on 10/6/20.
//

import UIKit

protocol PersonDetailViewControllerDelegate {
    func favoriteButtonPressed()
}

class PersonDetailViewController: UIViewController {
    var delegate: PersonDetailViewControllerDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var person: Person! = nil
    
    private let favoriteImageName = "heart"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    private func configureViews() {
        guard let person = person else { return }
        nameLabel.text = person.name
        
        configureFavoriteImage(person.isFavorite)
    }
    
    private func configureFavoriteImage(_ isFavorite: Bool) {
        let systemImageName = isFavorite ? favoriteImageName + ".fill" : favoriteImageName
        
        let heartImage = UIImage(systemName: systemImageName)
        favoriteButton.setImage(heartImage, for: .normal)
    }

    @IBAction func favoriteButtonPressed(_ sender: Any) {
        person.isFavorite.toggle()
        
        configureFavoriteImage(person.isFavorite)
        
        delegate?.favoriteButtonPressed()
    }
}
