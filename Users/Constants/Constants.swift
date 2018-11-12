//
//  Constants.swift
//  Users
//
//  Created by channabasavesh chandrappa budihal on 11/11/18.
//  Copyright © 2018 channabasavesh chandrappa budihal. All rights reserved.
//

import Foundation

struct Constants {
    
    // MARK: - Urls
    static let jsonUrl = "https://jsonplaceholder.typicode.com/users"
    
    // MARK: - Errors
    struct Errors {
        static let responseError = "Response Error"
        static let parseError = "Parse Error: "
    }
    
    // MARK: - Segue Identifiers
    struct SegueIdentifiers {
        static let detail = "DetailSegue"
        static let addressDetail = "AddressDetailSegue"
        static let companyDetail = "CompanyDetailSegue"
    }
    
    // MARK: - Navigation Titles
    struct NavigationTitles {
        static let users = NSLocalizedString("users", comment: "users")
        static let details = NSLocalizedString("details", comment: "details")
        static let address = NSLocalizedString("address", comment: "address")
        static let company = NSLocalizedString("company", comment: "company")
    }
    
    // MARK: - TableViewCell Identifiers
    struct TableViewCellIdentifier {
        static let users = "UsersTableViewCell"
        static let detail = "DetailTableViewCell"
    }
}
