//
//  cameraScreen.swift
//  Card Sorter Master
//
//  Created by Austin Shaw on 7/28/22.
//

import AVFoundation
import UIKit
import Vision
import Foundation
import CoreBluetooth
import SwiftUI
import CoreImage

class cameraScreen: UIViewController {
    var myImg: UIImage? = nil //global image variable
    var database: Array<CardData>? = nil
    let quitBtn = UIButton()
    let sortSettingsBtn = UIButton()
    let startScanning = UIButton()
    let backButton = UIButton()
    var testCounter = 0
    var cameraTimer: Timer?
    var elevatorTimer: Timer?
    var elevatorTimerTwo: Timer?
    var checkTimer: Timer?
    var delayOne: Timer?
    var delayTwo: Timer?
    var strikeCount = 0
    private var viewGuide: PartialTransparentView!
    
    let allSetCodes = ["KHM","TSR","STA","MH2","AFR","MID","VOW","NEO","SNC","CLB","2X2","ZNR","ZNC","CC1","CMR","2XM","JMP","M21","300","C20","UND","THB","SLD","GN2","MB1","ELD","C19","M20","MH1","WAR","GK2","GK2","GK2","GK2","GK2","RNA","MED","J19","UMA","GNT","G18","GRN","MED","GK1","C18","M19","GS1","SS1","CM2","BBD","DOM","DDU","A25","RIX","J18","UST","E02","V17","IMA","DDT","XLN","HTR","H17","C17","HOU","AR2","CMA","AKH","270","W17","DDS","MM3","AER","J17","PCA","C16","KLD","257","PZ2","PZ1","DDR","CN2","V16","EMN","EMA","SOI","W16","pMO","DDQ","OGW","J16","C15","EXP","BFZ","DDP","V15","CP3","ORI","MM2","TPR","DTK","DDO","CP2","FRF","UFP","J15","C14","KTK","DDN","V14","CP1","M15","PRE","D15","FNM","VMA","CNS","MD1","MPT","JOU","DDM","BNG","C13","THS","DDL","V13","M14","D14","MMA","DGM","DDK","GTC","CM1","RTR","DDJ","V12","M13","D13","PC2","AVR","DDI","DKA","PD3","ISD","DDH","V11","M12","CMD","NPH","DDG","MBS","ME4","PD2","SOM","DDF","V10","M11","ARC","PPR","DPA","ROE","DDE","WWK","H09","DDD","ZEN","ME3","HOP","V09","M10","ARB","DDC","CON","DD2","ALA","ME2","DRB","EVE","SHM","MOR","EVG","LRW","ME1","10E","FUT","PLC","TSB","TSP","CSP","GPP","DIS","HUK","GPT","DCI","RAV","9ED","SOK","BOK","UNH","CHK","5DN","DST","MRD","8ED","SCG","LGN","ONS","JUD","TOR","DKM","ODY","TD0","TD2","SDC","APC","7ED","GUR","PLS","BTD","INV","S00","PCY","NMS","BRB","MMQ","S99","UDS","PTK","6ED","ULG","ATH","USG","UGL","EXO","PO2","TMP","WTH","POR","AST","5ED","VIS","VAN","I2P","MIR","ARE","ALL","HML","CHR","ICE","4ED","FEM","DRK","3E2","LEG","3ED","ATQ","PRM","ARN","CED","2ED","LEB","LEA"]
    
    //camera button clicked DONE
    //0 is sent in a loop -> 10sec DONE
        //don't continue until sort condition is set DONE
    //1 is sent DONE
    //2-3 sec pause DONE
    //camera scans card (card separator) DONE
    //0 is sent w/in 1 sec DONE
    //1 is sent DONE
    
    //KEY:
    //1 feeds the card
    //5 “resets” elevator
    //scan “scans the card"
    //0 “raises elevator to feeding position”
    
    // Capture Session
    var session: AVCaptureSession?
    //Photo
    let output = AVCapturePhotoOutput()
    // Preview
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //edit
        //loading database in
        database = dataLoader().userData
        
        view.backgroundColor = .black
        view.layer.addSublayer(previewLayer)
        checkCameraPermission()
        
        addGuideView()
        
        elevatorTimerTwo = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(startElevator), userInfo: nil, repeats: true)
        print("first 0")
        RunLoop.current.add(elevatorTimerTwo!, forMode: .common)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = view.bounds
    }
    
    private func addGuideView() {
        let width = UIScreen.main.bounds.width - (UIScreen.main.bounds.width * 0.2)
        let height = width + (width * 0.45)
        let viewX = (UIScreen.main.bounds.width / 2) - (width / 2)
        let viewY = (UIScreen.main.bounds.height / 2) - (height / 2) - 100

        viewGuide = PartialTransparentView(rectsArray: [CGRect(x: viewX, y: viewY, width: width, height: height)])

        view.addSubview(viewGuide)
        viewGuide.translatesAutoresizingMaskIntoConstraints = false
        viewGuide.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        viewGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        viewGuide.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        viewGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        view.bringSubviewToFront(viewGuide)
        
        quitBtn.setTitle("Quit", for: .normal)
        view.addSubview(quitBtn)
        quitBtn.backgroundColor = .gray
        quitBtn.setTitleColor(.black, for: .normal)
        quitBtn.frame = CGRect(x: 154, y: 600, width: 100, height: 40)
       
        sortSettingsBtn.setTitle("Settings", for: .normal)
        view.addSubview(sortSettingsBtn)
        sortSettingsBtn.backgroundColor = .white
        sortSettingsBtn.setTitleColor(.black, for: .normal)
        sortSettingsBtn.frame = CGRect(x: 54, y: 600, width: 100, height: 40)
        
        startScanning.setTitle("Start", for: .normal)
        view.addSubview(startScanning)
        startScanning.backgroundColor = .green
        startScanning.setTitleColor(.black, for: .normal)
        startScanning.frame = CGRect(x: 254, y: 600, width: 100, height: 40)
        
        backButton.setTitle("Back", for: .normal)
        view.addSubview(backButton)
        backButton.backgroundColor = .blue
        backButton.setTitleColor(.black, for: .normal)
        backButton.frame = CGRect(x: 30, y: 50, width: 80, height: 35)
        
        quitBtn.addTarget(self, action: #selector(didTapQuit), for: .touchUpInside)
        sortSettingsBtn.addTarget(self, action: #selector(didTapSettings), for: .touchUpInside)
        startScanning.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        view.backgroundColor = .black
    }

    private func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {

        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else {
                    return
                }
                DispatchQueue.main.async {
                    self?.setUpCamera()
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setUpCamera()
        @unknown default:
            break
        }
    }
    
    private func setUpCamera() {
        let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
                if session.canAddOutput(output){
                    session.addOutput(output)
                }
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                
                session.startRunning()
                self.session = session
                
            }
            catch {
                print(error)
            }
        }
    }
    
    @objc func takePhoto() {
        if(strikeCount < 5) {
            ContentView.Manager.bleManager.sendMessage(data: "1")
            print("1 sent")
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                ContentView.Manager.bleManager.sendMessage(data: "5")
                print("5 sent")
                self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
                print("0 sending")
                self.elevatorSignalLooped()
            }
        } else {
           print("No card detected 5 times")
           cameraTimer?.invalidate()
        }
    }
    
    @objc private func didTapQuit() {
        cameraTimer?.invalidate()
        print("invalidated")
    }//quit button function
    
    @objc private func didTapSettings() {
        let rootVC = sortSettingsViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true)
    }
    
    @objc private func didTapStart() {
        if(sortSettingsContentView.sortManager.canSort == true) {
            cameraTimer = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(takePhoto), userInfo: nil, repeats: true)
        }else {
            print("Set up sort parameters")
        }
    }
    
    @objc private func didTapBackButton() {
        print("tapped")
        let rootVC = ViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        
        present(navVC, animated: true)
    }
    
    @objc private func startElevator() {
        //print("reached")
        ContentView.Manager.bleManager.sendMessage(data: "0")
    }//initial elevator rise
    
    @objc private func elevatorSignalLooped() {
        var counter = 0
        
        while(counter != 10){
            ContentView.Manager.bleManager.sendMessage(data: "0")
            counter += 1
        }
    }//send 0 in loop
}

extension cameraScreen: AVCapturePhotoCaptureDelegate {
    //ContentView.Manager.bleManager.sendMessage(data: "0")
    
    @objc private func elevatorCheck() {
        ContentView.Manager.bleManager.sendMessage(data: "0")
    }
    
    private func processImageNew(image: UIImage?) -> String{
        var text: String = ""
        
        guard let cgImage = image?.cgImage else { fatalError("Not passing") }
        
        //Handler
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        //Request
        let request = VNRecognizeTextRequest { request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                return
            }
            
            text = observations.compactMap({
                $0.topCandidates(1).first?.string
            }).joined(separator: ", ")
        }
        
        //Process request
        do {
            try handler.perform([request])
            return text
        }
        catch {
            print(error)
        }
        return text
    }//extract card elements (name, type, etc.) and store in strings
    
    private func processImageString(imgText: String) -> Substring {
        
        let arrayResult = imgText.split(separator: ",")
        guard let cardName = arrayResult.first else { return ""}
        
        //print(arrayResult)
        
        return cardName
    }
    
    private func returnCode(myString: Substring) -> String{
        let stringArr = myString.components(separatedBy: " ")
        
        for element in stringArr {
            if(allSetCodes.contains(element)) {
                return element
            }
        }
        return "null"
    }//StringContainsCode -> returns set code w/in string
    
    private func processImageSet(imgText: String) -> String {
        let arrayResult = imgText.split(separator: ",")
        
        for element in arrayResult {
            if(returnCode(myString: element) != "null") {
                return returnCode(myString: element)
            }
        }
        
        return "Set not found"
    }//processImageSet -> gets set code from scan
    
    private func processImageType(imgText: String) -> Substring {
        let arrayResult = imgText.split(separator: ",")
        
        for element in arrayResult {
            if(element.contains("Instant")) {
                return element
            } else if(element.contains("Sorcery")) {
                return element
            } else if(element.contains("Creature")) {
                return element
            } else if(element.contains("Enchantment")) {
                return element
            } else if(element.contains("Artifact")) {
                return element
            } else if(element.contains("Planeswalker")) {
                return element
            }
        }
        
        return "Not found"
    }//processImageType -> gets card type from scan
    
    private func processImageColor(imgText: String, cardName: String) -> String {
        //let arrayResult = imgText.split(separator: ",")
        
        //let cardName = processImageString(imgText: processImageNew(image: image))
        
        
        for card in database ?? [] {
            if(card.name == cardName) {
                return card.color_identity.joined(separator: ",")
            }
        }
        
        return "not found"
    }//processImageColor -> gets color identity of card
    
    private func processImageRarity(imgText: String) -> String {
        return ""
    }
    
    private func sortOperationCardType(sortParameter: String, myCard: CardData) -> String{
        if(sortSettingsContentView.sortManager.sortParam == sortParameter) {
            if myCard.type_line.contains("Creature"){//left
                ContentView.Manager.bleManager.sendMessage(data: "2")
                return myCard.name + " moved left"
            } else {//right
                ContentView.Manager.bleManager.sendMessage(data: "3")
                return myCard.name + " moved right"
            }
        }
        return "Not found"
    }//sorting procedure for card type encapsulated in its own function
    
    private func sortOperationColor(sortParameter: String, myCard: CardData) -> String {
        if(sortSettingsContentView.sortManager.sortParam == sortParameter) {
            if(myCard.color_identity.contains(sortParameter)) {
                ContentView.Manager.bleManager.sendMessage(data: "2")
                return myCard.name + " moved left"
            } else {
                ContentView.Manager.bleManager.sendMessage(data: "3")
                return myCard.name + " moved right"
            }
        }
        return "Not found"
    }//sorting procedure for color encapsulated in its own function
    
    private func sortOperationRarity(sortParameter: String, myCard: CardData) -> String {
        if(sortSettingsContentView.sortManager.sortParam == sortParameter) {
            if(myCard.rarity == sortParameter) {
                ContentView.Manager.bleManager.sendMessage(data: "2")
                return myCard.name + " moved left"
            } else {
                ContentView.Manager.bleManager.sendMessage(data: "3")
                return myCard.name + " moved right"
            }
        }
        return "Not found"
    }//sorting procedure for rarity encapsulated in its own function
    
    private func sortOperationCMC(sortParameter: String, myCard: CardData) -> String {
        if(sortSettingsContentView.sortManager.sortParam == "9+") {
            if(myCard.cmc >= 9.0) {
                ContentView.Manager.bleManager.sendMessage(data: "2")
                print(myCard.name + " moved left, cmc: " + String(myCard.cmc))
                return myCard.name + " moved left"
            } else {
                ContentView.Manager.bleManager.sendMessage(data: "3")
                print(myCard.name + " moved right, cmc: " + String(myCard.cmc))
                return myCard.name + " moved right"
            }
        } else {
            if(sortSettingsContentView.sortManager.sortParam == sortParameter) {
                if(myCard.cmc == Double(sortParameter)) {
                    ContentView.Manager.bleManager.sendMessage(data: "2")
                    print(myCard.name + " moved left, cmc: " + String(myCard.cmc))
                    return myCard.name + " moved left"
                } else {
                    ContentView.Manager.bleManager.sendMessage(data: "3")
                    print(myCard.name + " moved right, cmc: " + String(myCard.cmc))
                    return myCard.name + " moved right"
                }
            }
        }
        return "Not found"
    }//sorting procedure for cmc encapsulated in its own function
    
    internal func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?){
        guard let data = photo.fileDataRepresentation() else {
            return
        }
        print("Scanning")
        var noMatch = 0
        myImg = UIImage(data: data)
        let rotatedImage = UIImage(cgImage:(myImg?.cgImage!)!, scale: (myImg?.scale)!, orientation:UIImage.Orientation.right)

        
        testCounter += 1
        //session?.stopRunning()
        
        let imageView = UIImageView(image: myImg)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = view.bounds
        
        //view.addSubview(imageView)
        
        //let outputText = processImageNew(image: myImg)
        let outputText = processImageNew(image: rotatedImage)
        let setName = processImageSet(imgText: outputText)
        let cardName = processImageString(imgText: outputText)
        let cardType = processImageType(imgText: outputText)
        let cardColor = processImageColor(imgText: outputText, cardName: String(cardName))
        
        let outputLabel = UILabel(frame: CGRect(x: 50, y: 100, width: 400, height: 30))
        outputLabel.backgroundColor = .red
        outputLabel.textAlignment = .left
        outputLabel.text = String("No card detected")
        //noCardCount += 1
        view.addSubview(outputLabel)
       
        for card in database ?? [] {
            if card.name == cardName {
                strikeCount = 0
                if(sortSettingsContentView.sortManager.sortParam == "Creature") {
                    outputLabel.text = sortOperationCardType(sortParameter: "Creature", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "Artifact") {
                    outputLabel.text = sortOperationCardType(sortParameter: "Artifact", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "Enchantment") {
                    outputLabel.text = sortOperationCardType(sortParameter: "Enchantment", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "Instant") {
                    outputLabel.text = sortOperationCardType(sortParameter: "Instant", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "Sorcery") {
                    outputLabel.text = sortOperationCardType(sortParameter: "Sorcery", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "Planeswalker") {
                    outputLabel.text = sortOperationCardType(sortParameter: "Planeswalker", myCard: card)
                    break
                }  else if(sortSettingsContentView.sortManager.sortParam == "Land") {
                    outputLabel.text = sortOperationColor(sortParameter: "Land", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "U") {
                    outputLabel.text = sortOperationColor(sortParameter: "U", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "W") {
                    outputLabel.text = sortOperationColor(sortParameter: "W", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "R") {
                    outputLabel.text = sortOperationColor(sortParameter: "R", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "G") {
                    outputLabel.text = sortOperationColor(sortParameter: "G", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "B") {
                    outputLabel.text = sortOperationColor(sortParameter: "B", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "mythic rare") {
                    outputLabel.text = sortOperationRarity(sortParameter: "mythic rare", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "rare") {
                    outputLabel.text = sortOperationRarity(sortParameter: "rare", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "uncommon") {
                    outputLabel.text = sortOperationRarity(sortParameter: "uncommon", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "common") {
                    outputLabel.text = sortOperationRarity(sortParameter: "common", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "0.0") {
                    outputLabel.text = sortOperationCMC(sortParameter: "0.0", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "1.0") {
                    outputLabel.text = sortOperationCMC(sortParameter: "1.0", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "2.0") {
                    outputLabel.text = sortOperationCMC(sortParameter: "2.0", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "3.0") {
                    outputLabel.text = sortOperationCMC(sortParameter: "3.0", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "4.0") {
                    outputLabel.text = sortOperationCMC(sortParameter: "4.0", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "5.0") {
                    outputLabel.text = sortOperationCMC(sortParameter: "5.0", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "6.0") {
                    outputLabel.text = sortOperationCMC(sortParameter: "6.0", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "7.0") {
                    outputLabel.text = sortOperationCMC(sortParameter: "7.0", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "8.0") {
                    outputLabel.text = sortOperationCMC(sortParameter: "8.0", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "9+") {
                    outputLabel.text = sortOperationCMC(sortParameter: "9+", myCard: card)
                    break
                } else if(sortSettingsContentView.sortManager.sortParam == "Price") {
                    //print(sortByPrice.getPrice())
                }
            } else {
                noMatch += 1
            }//every time a card name does not match scanned name, noMatch is incremented
        }
        
        if(noMatch == database?.count) {
            strikeCount += 1
            print("Number of times card wasn't detected: " + String(strikeCount))
        }//if noMatch is equal to size of database, no card was found
    }
}


class PartialTransparentView: UIView {
    var rectsArray: [CGRect]?

        convenience init(rectsArray: [CGRect]) {
            self.init()

            self.rectsArray = rectsArray

            backgroundColor = UIColor.black.withAlphaComponent(0.6)
            isOpaque = false
        }

        override func draw(_ rect: CGRect) {
            backgroundColor?.setFill()
            UIRectFill(rect)

            guard let rectsArray = rectsArray else {
                return
            }

            for holeRect in rectsArray {
                let path = UIBezierPath(roundedRect: holeRect, cornerRadius: 10)

                let holeRectIntersection = rect.intersection(holeRect)

                UIRectFill(holeRectIntersection)

                UIColor.clear.setFill()
                UIGraphicsGetCurrentContext()?.setBlendMode(CGBlendMode.copy)
                path.fill()
            }
        }
}
