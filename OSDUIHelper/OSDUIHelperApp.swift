//
//  OSDUIHelperApp.swift
//  OSDUIHelper
//
//  Created by Eric Rabil on 6/6/21.
//

import SwiftUI

@main
struct OSDUIHelperApp: App {
    static func main() {
        CGIntegration.shared.registerForDismissingEvents()
        
        let listener = NSXPCListener(machServiceName: "com.apple.OSDUIHelper")
        listener.delegate = OSDUIHelperDelegate.shared
        listener.resume()
        
        NSApplication.shared.run()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
