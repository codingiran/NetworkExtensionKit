//
//  NEProviderStopReason+.swift
//  NetworkExtensionKit
//
//  Created by iran.qiu on 2023/8/8.
//

#if canImport(NetworkExtension)

import Foundation
import NetworkExtension

extension NEProviderStopReason: @retroactive CustomStringConvertible {
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

        case .internalError:
            return "internalError"

        @unknown default:
            return "unknown"
        }
    }
}

#endif
