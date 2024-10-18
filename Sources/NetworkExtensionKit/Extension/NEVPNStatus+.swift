//
//  NEVPNStatus+.swift
//  NetworkExtensionKit
//
//  Created by iran.qiu on 2023/8/26.
//

#if canImport(NetworkExtension)

import Foundation
import NetworkExtension

extension NEVPNStatus: @retroactive CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalid:
            return "invalid"
        case .disconnected:
            return "disconnected"
        case .connecting:
            return "connecting"
        case .connected:
            return "connected"
        case .reasserting:
            return "reasserting"
        case .disconnecting:
            return "disconnecting"
        @unknown default:
            return "undefined"
        }
    }
}

#endif
