//
//  CGIntegration.swift
//  OSDUIHelper
//
//  Created by Eric Rabil on 6/6/21.
//

import Foundation
import CoreGraphics

let CGNotifyProcHandler: CGSNotifyProcPtr = { type, data, dataLength, userData in
    CGIntegration.shared.handleDismissingEvent()
}

let CFNotificationCenterThemeChangeHandler: CFNotificationCallback = { center, observer, notificationName, object, userInfo in
    CGIntegration.shared.handleDismissingEvent()
}

extension CGSNotificationType {
    static let displayDidReconfigure: CGSNotificationType = .init(0x65)
    static let displayFullScreenAppDone: CGSNotificationType = .init(0x75)
    static let displayHardwareChanged: CGSNotificationType = .init(0x6f)
    static let displayWillReconfigure: CGSNotificationType = .init(0x64)
}

extension Notification.Name {
    static let hideAndRemoveAllOSDOverlays: Notification.Name = .init("hideAndRemoveAllOSDOverlays")
}

class CGIntegration {
    static let shared = CGIntegration()
    
    func registerForDismissingEvents() {
        CGSRegisterNotifyProc(CGNotifyProcHandler, .displayDidReconfigure, nil)
        CGSRegisterNotifyProc(CGNotifyProcHandler, .displayFullScreenAppDone, nil)
        CGSRegisterNotifyProc(CGNotifyProcHandler, .displayHardwareChanged, nil)
        CGSRegisterNotifyProc(CGNotifyProcHandler, .displayWillReconfigure, nil)
        
        if let center = CFNotificationCenterGetDistributedCenter() {
            CFNotificationCenterAddObserver(center, nil, CFNotificationCenterThemeChangeHandler, "AppleInterfaceThemeChangedNotification" as CFString, nil, .deliverImmediately)
        }
    }
    
    func handleDismissingEvent() {
        NotificationCenter.default.post(name: .hideAndRemoveAllOSDOverlays, object: nil)
    }
}
