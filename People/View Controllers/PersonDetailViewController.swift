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
        
        if person.isFavorite {
            let systemImageName = favoriteImageName + ".fill"
            
        }
        
        
    }
    

    @IBAction func favoriteButtonPressed(_ sender: Any) {
        person.isFavorite.toggle()
        delegate?.favoriteButtonPressed()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
