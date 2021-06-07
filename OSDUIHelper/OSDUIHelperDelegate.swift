//
//  OSDUIHelperDelegate.swift
//  OSDUIHelper
//
//  Created by Eric Rabil on 6/6/21.
//

import Foundation
import os.log

fileprivate let log = Logger(subsystem: "com.apple.OSDUIHelper", category: "OSDUIHelperDelegate")

@objc class OSDUIHelperDelegate: NSObject, NSXPCListenerDelegate {
    static let shared = OSDUIHelperDelegate()
    
    @objc func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        let interface = NSXPCInterface(with: OSDUIHelperProtocol.self)
        
        newConnection.exportedInterface = interface
        newConnection.exportedObject = OSDUIHelper.shared
        newConnection.resume()
        
        log.info("Accepting connection")
        
        return true
    }
}
