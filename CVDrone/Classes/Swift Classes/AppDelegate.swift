//
//  AppDelegate.swift
//  CVDrone
//
//  Created by Cian Duffy on 08/11/2016.
//  Copyright © 2016 Cian Duffy. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var droneController :DroneController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NodeCopterConnectionManager.sharedManager.connectToHostOnPort(hostAddress: "http://localhost", portNumber: 3000)
        self.droneController = DroneController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func connectButtonPressed(sender: NSButton) {
        self.droneController.sendConnectCommand()
    }
    
    @IBAction func takeoffButtonPressed(sender: NSButton) {
        self.droneController.sendTakeoffCommand()
    }
    
    @IBAction func landButtonPressed(sender: NSButton) {
        self.droneController.sendLandCommand()
    }
}

