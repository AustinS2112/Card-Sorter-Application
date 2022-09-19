//
//  ContentView.swift
//  BluetoothPostion
//
//  Created by Jeremiah Givens on 12/16/21.
//

import SwiftUI
import CoreBluetooth
import UIKit

struct ContentView: View {
    //@StateObject var bleManager = BLEManager()
    @State var locationFetcher = LocationFetcher()
    
    struct Manager {
        static var bleManager = BLEManager()
    }
    
    
    init(){
        locationFetcher.start()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Divider()
                Spacer()
                ScrollView{
                    ForEach(Array(Manager.bleManager.foundPeripherals.keys), id: \.self){key in
                        HStack{
                            Text(Manager.bleManager.foundPeripherals[key]?.name ?? "Name not found")
                                .foregroundColor(Color(.label))
                                .font(.headline)
                            Spacer()
                            Button("Connect"){
                                Manager.bleManager.setPeripheral(peripheral: Manager.bleManager.foundPeripherals[key])
                            }
                        }
                    }
                    .padding()
                    Divider()
                }
                
                //Text("Message: \(bleManager.message)")
                    //.padding()
                Button("Send Message"){
                   // let message: String = "1"
                    //let message = MessageStruct(message: "1")
                    Manager.bleManager.sendMessage(data: "1")
                    //print(message)
                }
                .padding()
                .background(Color.green)
                .foregroundColor(Color(.label))
                Spacer()
            }
            .navigationTitle("HM-10's in Area")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
