//
//  AddressDetailTableViewController.swift
//  Users
//
//  Created by channabasavesh chandrappa budihal on 12/11/18.
//  Copyright © 2018 channabasavesh chandrappa budihal. All rights reserved.
//

import UIKit

enum AddressRowType: String {
    case suite
    case street
    case city
    case zipcode
    case geo
    
    var localizedTitle: String {
        var title: String
        switch self {
        case .suite:
            title = NSLocalizedString("suite", comment: "suite")
        case .street:
            title = NSLocalizedString("street", comment: "street")
        case .city:
            title = NSLocalizedString("city", comment: "city")
        case .zipcode:
            title = NSLocalizedString("zip_Code", comment: "zip_Code")
        case .geo:
            title = NSLocalizedString("geo", comment: "geo")
        }
        return title
    }
}

class AddressDetailTableViewController: UITableViewController {
    
    var address: User.Address?
    var items: [AddressRowType] = [.suite, .street, .city, .zipcode, .geo]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.NavigationTitles.address
    }
}

// MARK: - Table view data source

extension AddressDetailTableViewController {
    
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
        case .suite:
            cell.detailValueLabel.text = address?.suite.capitalized
        case .street:
            cell.detailValueLabel.text = address?.street.capitalized
        case .city:
            cell.detailValueLabel.text = address?.city.capitalized
        case .zipcode:
            cell.detailValueLabel.text = address?.zipcode.capitalized
        case .geo:
            cell.detailValueLabel.text = "Lat: \(address?.geo.lat ?? "")\nLng: \(address?.geo.lng ?? "")"
        }
        return cell
    }
}
