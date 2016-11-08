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
        
        let hostURL = URL(string: hostAddress)
        
        self.socket = SocketIOClient(socketURL: hostURL!, config: [.log(true), .forcePolling(true)])
    }
    
    func sendEventToHostWithArguments(eventType: String, arguments: Array<Any>) {
        self.socket.emit(eventType, with: arguments)
    }
}
