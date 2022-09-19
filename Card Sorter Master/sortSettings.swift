//
//  sortSettings.swift
//  Card Sorter Master
//
//  Created by Austin Shaw on 8/3/22.
//

import Foundation
import SwiftUI

class sortSettings: UIViewController {
    let sortVar = UITextField()
    let enterButton = UIButton()
    
    struct sortManager {
        static var userSortVar = ""
        static var canSort = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        configureTextFields()
        configureTapGesture()
        
        sortVar.backgroundColor = .white
        sortVar.frame = CGRect(x: 90, y: 100, width: 200, height: 50)
        sortVar.textColor = .black
        view.addSubview(sortVar)
        
        enterButton.setTitle("Enter", for: .normal)
        view.addSubview(enterButton)
        enterButton.backgroundColor = .systemBlue
        enterButton.setTitleColor(.black, for: .normal)
        enterButton.frame = CGRect(x: 90, y: 200, width: 200, height: 52)
        
        enterButton.addTarget(self, action: #selector(enterInfo), for: .touchUpInside)
        
    }
    
    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sortSettings.handleTap))
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
     //edit
    @objc private func enterInfo() {
        sortManager.userSortVar = sortVar.text ?? ""
        print(sortManager.userSortVar)
    
        //turn main belt on
        //let turnOn = MessageStruct(message: "1")
        //ContentView.Manager.bleManager.sendStruct(messageToSend: turnOn)
        
        //turn on scanning
        sortManager.canSort = true
        
        view.endEditing(true)
    }
    
    private func configureTextFields() {
        sortVar.delegate = self
    }
    
    @IBAction func enterTapped(){
        view.endEditing(true)
    }
}

extension sortSettings: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        sortVar.resignFirstResponder()
        return true
    }
}
