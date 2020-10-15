//
//  PeopleTableViewController.swift
//  People
//
//  Created by Hector Villasano on 10/6/20.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    let peopleController = PeopleController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleController.peopleList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath) as? PersonTableViewCell else {
            return UITableViewCell()
        }
        
        let person = peopleController.peopleList[indexPath.row]
        cell.person = person
        
        return cell
    }
}

// MARK: - Navigation

extension PeopleTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PersonCellSegue" {
            if let personDetailVC = segue.destination as? PersonDetailViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                
                let person = peopleController.peopleList[indexPath.row]
                personDetailVC.person = person
                personDetailVC.delegate = self
            }
        }
    }
}

// MARK: - PersonDetailViewControllerDelegate

extension PeopleTableViewController: PersonDetailViewControllerDelegate {
    func favoriteButtonPressed() {
        DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
    }
}
