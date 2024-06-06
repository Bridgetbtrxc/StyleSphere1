//
//  UIDevice+Pad.swift
//  StyleSphere
//
//  on 02/06/24.
//

import Foundation
import UIKit

extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
