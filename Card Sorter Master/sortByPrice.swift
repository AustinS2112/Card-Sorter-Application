//
//  sortByPrice.swift
//  Card Sorter Master
//
//  Created by Austin Shaw on 8/15/22.
//

import SwiftUI

class sortByPrice: UIViewController {
    let textInput = UITextView()
    let enterButton = UIButton()
    
    struct sortByPriceManager {
        static var userInput: String = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        textInput.frame = CGRect(x: 87, y: 200, width: 200, height: 52)
        view.addSubview(textInput)
        
        enterButton.setTitle("Enter", for: .normal)
        view.addSubview(enterButton)
        enterButton.backgroundColor = .systemBlue
        enterButton.setTitleColor(.black, for: .normal)
        enterButton.frame = CGRect(x: 87, y: 100, width: 200, height: 52)
        enterButton.addTarget(self, action: #selector(didTapEnterBtn), for: .touchUpInside)
    }//viewDidLoad
    
    @objc private func didTapEnterBtn() {
        sortByPriceManager.userInput = textInput.text
    }//didTapEnterBtn
    
}
