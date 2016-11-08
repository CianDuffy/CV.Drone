//
//  DroneController.swift
//  CVDrone
//
//  Created by Cian Duffy on 08/11/2016.
//  Copyright © 2016 Cian Duffy. All rights reserved.
//

import Cocoa

class DroneController: NSObject {
    
    func sendTakeoffCommand() {
        NodeCopterConnectionManager.sharedManager.sendEventToHost(eventType: "takeoff")
        print("Sending message: Takeoff")
    }
    
    func sendLandCommand() {
        NodeCopterConnectionManager.sharedManager.sendEventToHost(eventType: "land")
        print("Sending message: Land")
    }
    
    func sendConnectCommand() {
        NodeCopterConnectionManager.sharedManager.sendEventToHostWithArguments(eventType: "connect-to-drone", arguments: [true])
        print("Sending message: Connect")
    }
}
