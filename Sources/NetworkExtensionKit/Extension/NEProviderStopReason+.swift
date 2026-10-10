//
//  NEProviderStopReason+.swift
//  NetworkExtensionKit
//
//  Created by iran.qiu on 2023/8/8.
//

#if canImport(NetworkExtension)

import Foundation
import NetworkExtension

#if compiler(>=6.0)
extension NEProviderStopReason: @retroactive CustomStringConvertible {}
#else
extension NEProviderStopReason: CustomStringConvertible {}
#endif

extension NEProviderStopReason {
    public var description: String {
        switch self {
        case .userInitiated:
            return "userInitiated"

        case .providerFailed:
            return "providerFailed"

        case .noNetworkAvailable:
            return "noNetworkAvailable"

        case .unrecoverableNetworkChange:
            return "unrecoverableNetworkChange"

        case .providerDisabled:
            return "providerDisabled"

        case .authenticationCanceled:
            return "authenticationCanceled"

        case .configurationFailed:
            return "configurationFailed"

        case .idleTimeout:
            return "idleTimeout"

        case .configurationDisabled:
            return "configurationDisabled"

        case .configurationRemoved:
            return "configurationRemoved"

        case .superceded:
            return "superceded"

        case .userLogout:
            return "userLogout"

        case .userSwitch:
            return "userSwitch"

        case .connectionFailed:
            return "connectionFailed"

        case .sleep:
            return "sleep"

        case .appUpdate:
            return "appUpdate"

        case .none:
            return "none"

        default:
            // Apple's internalError is raw value 17 (macOS 15.1 / iOS 18.1).
            // Decode it without referencing a symbol absent from older SDKs.
            return rawValue == 17 ? "internalError" : "unknown"
        }
    }
}

#endif
