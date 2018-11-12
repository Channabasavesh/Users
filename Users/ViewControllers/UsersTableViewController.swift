//
//  UsersTableViewController.swift
//  Users
//
//  Created by channabasavesh chandrappa budihal on 11/11/18.
//  Copyright © 2018 channabasavesh chandrappa budihal. All rights reserved.
//

import UIKit

class UsersTableViewController: UITableViewController {
    
    var dataManager = DataManager()
    var usersList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataManager.getUsers {[weak self] (error) in
            DispatchQueue.main.async {
                if let usersList = self?.dataManager.users.compactMap({ $0.name }) {
                    self?.usersList = usersList
                }
                self?.navigationItem.title = Constants.NavigationTitles.users
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - Table view data source

extension UsersTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellIdentifier.users, for: indexPath) as? UsersTableViewCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = usersList[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

// MARK: - Table view delegate & Segue

extension UsersTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Constants.SegueIdentifiers.detail, sender: dataManager.users[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let userDetailsTVC = segue.destination as? UserDetailsTableViewController else { return }
        guard let user = sender as? User else { return }
        userDetailsTVC.user  = user
    }
}
