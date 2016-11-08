//
//  NodeCopterConnectionManager.swift
//  CVDrone
//
//  Created by Cian Duffy on 08/11/2016.
//  Copyright © 2016 Cian Duffy. All rights reserved.
//

import Cocoa
import SocketIO

class NodeCopterConnectionManager: NSObject {
    var socket: SocketIOClient!
    var hostURL: URL!
    
    static let sharedManager: NodeCopterConnectionManager = {
        
        let instance = NodeCopterConnectionManager()
        
        return instance
    }()
    
    
    func connectToHostOnPort( hostAddress: String, portNumber: Int){
        var hostAddress = hostAddress
        if hostAddress.characters.last! != ":" {
            hostAddress.append(":")
        }
        hostAddress = "\(hostAddress)\(portNumber)"
        self.hostURL = URL(string: hostAddress)
        
        self.socket = SocketIOClient(socketURL: self.hostURL!, config: [.log(true), .forcePolling(true)])
        
        self.socket.on("connect") {data, ack in
            print("socket connected")
        }
        
        self.socket.connect()
    }
    
    func sendEventToHostWithArguments(eventType: String, arguments: Array<Any>) {
        self.socket.emit(eventType, with: arguments)
    }
    
    func sendEventToHost(eventType: String) {
        self.socket.emit(eventType, with: []);
    }
}
