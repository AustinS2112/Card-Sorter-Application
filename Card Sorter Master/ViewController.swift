//
//  ViewController.swift
//  Example-Code
//
//  Created by Xiangyu Chen on 7/5/22.
// test 3:59


import AVFoundation
import UIKit
import Vision
import Foundation
import CoreBluetooth
import SwiftUI

class ViewController: UIViewController {
    let bluetoothButton = UIButton()  //button to go to bluetooth connection screen
    let cameraButton = UIButton() //button to go to camera
    let continuousSignalBtn = UIButton()
    var signalTimer: Timer?
    var testCounter = 0;
    //@StateObject var bleManager = BLEManager()
    
    struct homeManager {
        static var setCodes: Array<String>? = nil
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //bluetooth button
        bluetoothButton.setTitle("Bluetooth Settings", for: .normal)
        view.addSubview(bluetoothButton)
        bluetoothButton.backgroundColor = .green
        bluetoothButton.setTitleColor(.black, for: .normal)
        bluetoothButton.frame = CGRect(x: 87, y: 200, width: 200, height: 52)
        //bluetoothButton.center = view.center
        
        //camera button
        cameraButton.setTitle("Go to Camera", for: .normal)
        view.addSubview(cameraButton)
        cameraButton.backgroundColor = .green
        cameraButton.setTitleColor(.black, for: .normal)
        cameraButton.frame = CGRect(x: 87, y: 100, width: 200, height: 52)
        
        /*continuousSignalBtn.setTitle("Send 0", for: .normal)
        view.addSubview(continuousSignalBtn)
        continuousSignalBtn.backgroundColor = .red
        continuousSignalBtn.setTitleColor(.black, for: .normal)
        continuousSignalBtn.frame = CGRect(x: 87, y: 300, width: 200, height: 52)*/
        
        //button actions
        bluetoothButton.addTarget(self, action: #selector(didTapButtonBT), for: .touchUpInside)
        cameraButton.addTarget(self, action: #selector(didTapButtonCamera), for: .touchUpInside)
        //continuousSignalBtn.addTarget(self, action: #selector(didTapContSignalBtn), for: .touchUpInside)
    }//viewDidLoad
    
    @objc private func didTapButtonBT() {
        let rootVC = bluetoothConnectionScreen()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
         
        present(navVC, animated: true)
    }//bluetooth button action
    //edit
    @objc private func didTapButtonCamera() {
        //sendSignal()
        let rootVC = cameraScreen()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        
        present(navVC, animated: true)

    }//camera button action
    
    @objc private func didTapContSignalBtn() {
        signalTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(sendSignal), userInfo: nil, repeats: true)
    }
    
    @objc func sendSignal() {
        if(testCounter < 70) {
            print("signal sent: " + String(testCounter))
            ContentView.Manager.bleManager.sendMessage(data: "0")
            testCounter += 1
        }
    }
    
    @objc private func didTapContSignalBtnOnce() {
        let contSignal = MessageStruct(message: "0")
        ContentView.Manager.bleManager.sendStruct(messageToSend: contSignal)
        //ContentView.Manager.bleManager.sendStruct(messageToSend: contSignal)
    }
    
    //1 -> motor goes up
    //2 -> motor goes down
}

