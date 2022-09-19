//
//  sortSettingsViewController.swift
//  Card Sorter Master
//
//  Created by Austin Shaw on 8/13/22.
//

import Foundation
import SwiftUI

class sortSettingsViewController: UIViewController {
    let sortSettingsScreen = UIHostingController(rootView: sortSettingsContentView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(sortSettingsScreen)
        view.addSubview(sortSettingsScreen.view)
        setUpConstraints()
    }
    
    fileprivate func setUpConstraints() {
        sortSettingsScreen.view.translatesAutoresizingMaskIntoConstraints = false
        sortSettingsScreen.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        sortSettingsScreen.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        sortSettingsScreen.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sortSettingsScreen.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
