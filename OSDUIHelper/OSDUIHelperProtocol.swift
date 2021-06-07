//
//  OSDUIHelperProtocol.swift
//  OSDUIHelper
//
//  Created by Eric Rabil on 6/6/21.
//

import Foundation
import CoreGraphics

@objc enum OSDGraphic: CLongLong {
    case backlight = 1
    case speaker = 3
    case speakerMuted = 4
    case eject = 6
    case noWifi = 9
    case keyboardBacklightMeter = 11
    case keyboardBacklightDisabledMeter = 12
    case keyboardBacklightNotConnected = 13
    case keyboardBacklightDisabledNotConnected = 14
    case macProOpen = 15
    case hotspot = 19
    case sleep = 20
    
    var resolved: OSDGraphic {
        switch rawValue {
        case 1:
            fallthrough
        case 2:
            fallthrough
        case 7:
            fallthrough
        case 8:
            return .backlight
        case 3:
            fallthrough
        case 5:
            fallthrough
        case 17:
            fallthrough
        case 23:
            return .speaker
        case 4:
            fallthrough
        case 16:
            fallthrough
        case 21:
            fallthrough
        case 22:
            return .speakerMuted
        case 6:
            return .eject
        case 9:
            return .noWifi
        case 11:
            fallthrough
        case 25:
            return .keyboardBacklightMeter
        case 12:
            fallthrough
        case 26:
            return .keyboardBacklightDisabledMeter
        case 13:
            fallthrough
        case 27:
            return .keyboardBacklightNotConnected
        case 14:
            fallthrough
        case 28:
            return .keyboardBacklightDisabledNotConnected
        case 15:
            return .macProOpen
        case 19:
            return .hotspot
        case 20:
            return .sleep
        default:
            return self
        }
    }
}

@objc enum OSDPriority: UInt {
    case `default` = 0x1f4
}

@objc protocol OSDUIHelperProtocol {
    @objc func fadeClassicImageOnDisplay(_ display: Any) -> Void
    @objc func showImage(_ image: OSDGraphic, onDisplayID displayID: CGDirectDisplayID, priority: OSDPriority, msecUntilFade: UInt) -> Void
    @objc func showFullScreenImage(_ image: OSDGraphic, onDisplayID displayID: CGDirectDisplayID, priority: OSDPriority, msecToAnimate: Any) -> Void
    @objc func showImage(_ image: OSDGraphic, onDisplayID displayID: CGDirectDisplayID, priority: OSDPriority, msecUntilFade: UInt, withText text: String) -> Void
    @objc func showImageAtPath(_ path: String, onDisplayID displayID: CGDirectDisplayID, priority: OSDPriority, msecUntilFade: UInt, withText text: String) -> Void
    @objc func showImage(_ image: OSDGraphic, onDisplayID displayID: CGDirectDisplayID, priority: OSDPriority, msecUntilFade: UInt, filledChiclets: UInt, totalChiclets: UInt, locked: Bool) -> Void
}
