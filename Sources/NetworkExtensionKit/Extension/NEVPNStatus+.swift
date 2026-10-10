//
//  NEVPNStatus+.swift
//  NetworkExtensionKit
//
//  Created by iran.qiu on 2023/8/26.
//

#if canImport(NetworkExtension)

import Foundation
import NetworkExtension

#if compiler(>=6.0)
extension NEVPNStatus: @retroactive CustomStringConvertible {}
#else
extension NEVPNStatus: CustomStringConvertible {}
#endif

extension NEVPNStatus {
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
