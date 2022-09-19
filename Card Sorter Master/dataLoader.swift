//
//  dataLoader.swift
//  Card Sorter Master
//
//  Created by Austin Shaw on 7/22/22.
//updated
//

import Foundation

public class dataLoader {
    
    @Published var userData = [CardData]()
    
    init(){
        load()
    }
    
    func load(){
        
        
        if let fileLocation = Bundle.main.url(forResource: "default_cards", withExtension: "json") {
            //do catch in case of error
            do{
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJSON = try jsonDecoder.decode([CardData].self, from: data)
                
                self.userData = dataFromJSON
            }catch{
                print(error)
            }
        }
    }//load
}
