//
//  OSDUIHelperObject.swift
//  OSDUIHelper
//
//  Created by Eric Rabil on 6/6/21.
//

import Foundation
import os.log
import AppKit

fileprivate let log = Logger(subsystem: "com.apple.OSDUIHelper", category: "OSDUIHelper")

@objc(OSDUIHelper)
class OSDUIHelper: NSObject, OSDUIHelperProtocol {
    @objc func fadeClassicImageOnDisplay(_ display: Any) {
        
    }
    
    @objc func showImage(_ image: OSDGraphic, onDisplayID displayID: CGDirectDisplayID, priority: OSDPriority, msecUntilFade: UInt) {
        
    }
    
    @objc func showFullScreenImage(_ image: OSDGraphic, onDisplayID displayID: CGDirectDisplayID, priority: OSDPriority, msecToAnimate: Any) {
        
    }
    
    @objc func showImage(_ image: OSDGraphic, onDisplayID displayID: CGDirectDisplayID, priority: OSDPriority, msecUntilFade: UInt, withText text: String) {
        
    }
    
    @objc func showImageAtPath(_ path: String, onDisplayID displayID: CGDirectDisplayID, priority: OSDPriority, msecUntilFade: UInt, withText text: String) {
        
    }
    
    @objc func showImage(_ image: OSDGraphic, onDisplayID displayID: CGDirectDisplayID, priority: OSDPriority, msecUntilFade: UInt, filledChiclets: UInt, totalChiclets: UInt, locked: Bool) {
        let image = image.resolved
        let window = NSWindow()
        
        print(image)
    }
    
    
    static let shared = OSDUIHelper()
}
