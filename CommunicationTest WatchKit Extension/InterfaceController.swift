//
//  InterfaceController.swift
//  CommunicationTest WatchKit Extension
//
//  Created by Parrot on 2019-10-26.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    
    @IBOutlet var hungerLevel: WKInterfaceLabel!
    @IBOutlet var currentLife: WKInterfaceLabel!
    // MARK: Outlets
    // ---------------------
    @IBOutlet var messageLabel: WKInterfaceLabel!
   
    // Imageview for the pokemon
    @IBOutlet var pokemonImageView: WKInterfaceImage!
    // Label for Pokemon name (Albert is hungry)
    @IBOutlet var nameLabel: WKInterfaceLabel!
    // Label for other messages (HP:100, Hunger:0)
    @IBOutlet var outputLabel: WKInterfaceLabel!
    
    @IBOutlet var pokemonName: WKInterfaceLabel!
    
    @IBOutlet var playerChoice: WKInterfaceLabel!
    
    // MARK: Delegate functions
    // ---------------------

    // Default function, required by the WCSessionDelegate on the Watch side
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        //@TODO
    }
    
    // 3. Get messages from PHONE
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("WATCH: Got message from Phone")
        // Message from phone comes in this format: ["course":"MADT"]
       // let messageBody = message["course"] as! String
      //  messageLabel.setText(messageBody)
        let messageName = message["name"] as! String
       playerChoice.setText(messageName)
        _ = message["name"] as! String
        playerChoice.setText(messageName)
        showImage(name:"PIKACHU")
    }
    


    
    // MARK: WatchKit Interface Controller Functions
    // ----------------------------------
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        
        // 1. Check if teh watch supports sessions
        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
        
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    
    // MARK: Actions
    // ---------------------
    
    // 2. When person presses button on watch, send a message to the phone
    @IBAction func buttonPressed() {
    }
    func showImage(name:String) {
        if(name == "PIKACHU"){
            print("pika is selected")
        }
        else if(name == "CATERPIE"){
            print("caterpie is selected")
        }
    }
    

    // MARK: Functions for Pokemon Parenting
    @IBAction func nameButtonPressed() {
        print("name button pressed")
    }

    @IBAction func startButtonPressed() {
        print("Start button pressed")
    }
    
    @IBAction func feedButtonPressed() {
        print("Feed button pressed")
    }
    
    @IBAction func hibernateButtonPressed() {
        print("Hibernate button pressed")
    }

    @IBAction func feedPokemon() {
    }
}
