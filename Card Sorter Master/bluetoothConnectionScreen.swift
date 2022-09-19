//
//  bluetoothConnectionScreen.swift
//  Card Sorter Master
//
//  Created by Austin Shaw on 7/27/22.
//

import Foundation
import SwiftUI

class bluetoothConnectionScreen: UIViewController {
    @IBOutlet weak var connectionScreen: UIView!
    let contentView = UIHostingController(rootView: ContentView())
    let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(contentView)
        view.addSubview(contentView.view)
        setUpConstraints()
        
        backButton.setTitle("Back", for: .normal)
        view.addSubview(backButton)
        backButton.backgroundColor = .green
        backButton.setTitleColor(.black, for: .normal)
        backButton.frame = CGRect(x: 200, y: 300, width: 100, height: 52)
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        let rootVC = ViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        
        present(navVC, animated: true)
    }//bluetooth button action
    
    fileprivate func setUpConstraints() {
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}//bluetoothConnectionScreen
