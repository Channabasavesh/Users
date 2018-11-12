//
//  UserDetailsTableViewController.swift
//  Users
//
//  Created by channabasavesh chandrappa budihal on 12/11/18.
//  Copyright © 2018 channabasavesh chandrappa budihal. All rights reserved.
//

import UIKit

enum UserDetailRowType: String {
    case name
    case id
    case username
    case phone
    case email
    case website
    case address
    case company
    
    var localizedTitle: String {
        var title: String
        switch self {
        case .name:
            title = NSLocalizedString("name", comment: "name")
        case .id:
            title = NSLocalizedString("id", comment: "id")
        case .username:
            title = NSLocalizedString("username", comment: "username")
        case .phone:
            title = NSLocalizedString("phone", comment: "phone")
        case .email:
            title = NSLocalizedString("email", comment: "email")
        case .website:
            title = NSLocalizedString("website", comment: "website")
        case .address:
            title = NSLocalizedString("address", comment: "address")
        case .company:
            title = NSLocalizedString("company", comment: "company")
        }
        return title
    }
}

class UserDetailsTableViewController: UITableViewController {
    
    var user: User?
    var items: [UserDetailRowType] = [.name, .id, .username, .phone, .email, .website, .address, .company]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.NavigationTitles.details
    }
}

// MARK: - Table view data source

extension UserDetailsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellIdentifier.detail, for: indexPath) as? DetailTableViewCell else { return UITableViewCell() }
        
        let rowType = self.items[indexPath.row]
        cell.detailKeyLabel.text = rowType.localizedTitle
        
        switch rowType {
        case .name:
            cell.detailValueLabel.text = user?.name.capitalized
        case .id:
            if let id = user?.id {
                cell.detailValueLabel.text = String(id)
            }
        case .username:
            cell.detailValueLabel.text = user?.username.capitalized
        case .phone:
            cell.detailValueLabel.text = user?.phone.capitalized
        case .email:
            cell.detailValueLabel.text = user?.email.capitalized
        case .website:
            cell.detailValueLabel.text = user?.website.capitalized
        case .address,.company:
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }
}

// MARK: - Table view delegate & Segue

extension UserDetailsTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if items[indexPath.row] == .address {
            self.performSegue(withIdentifier: Constants.SegueIdentifiers.addressDetail, sender: user?.address)
        }
        else if items[indexPath.row] == .company {
            self.performSegue(withIdentifier: Constants.SegueIdentifiers.companyDetail, sender: user?.company)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.SegueIdentifiers.addressDetail {
            guard let addressDetailVC = segue.destination as? AddressDetailTableViewController else { return }
            guard let address = sender as? User.Address else { return }
            addressDetailVC.address = address
        }
        else if segue.identifier == Constants.SegueIdentifiers.companyDetail {
            guard let addressDetailVC = segue.destination as? CompanyDetailTableViewController else { return }
            guard let company = sender as? User.Company else { return }
            addressDetailVC.company = company
        }
    }
}

