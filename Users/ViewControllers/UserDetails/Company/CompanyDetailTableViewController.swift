//
//  CompanyDetailTableViewController.swift
//  Users
//
//  Created by channabasavesh chandrappa budihal on 12/11/18.
//  Copyright © 2018 channabasavesh chandrappa budihal. All rights reserved.
//

import UIKit

enum CompanyRowType: String {
    case name
    case businessService
    case catchPhrase
    
    var localizedTitle: String {
        var title: String
        switch self {
        case .name:
            title = NSLocalizedString("name", comment: "name")
        case .businessService:
            title = NSLocalizedString("business_Service", comment: "business_Service")
        case .catchPhrase:
            title = NSLocalizedString("catch_Phrase", comment: "catch_Phrase")
        }
        return title
    }
}

class CompanyDetailTableViewController: UITableViewController {
    
    var company: User.Company?
    var items: [CompanyRowType] = [.name, .businessService, .catchPhrase]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.NavigationTitles.company
    }
}

// MARK: - Table view data source

extension CompanyDetailTableViewController {
    
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
            cell.detailValueLabel.text = company?.name.capitalized
        case .businessService:
            cell.detailValueLabel.text = company?.businessService.capitalized
        case .catchPhrase:
            cell.detailValueLabel.text = company?.catchPhrase.capitalized
        }
        return cell
    }
}
