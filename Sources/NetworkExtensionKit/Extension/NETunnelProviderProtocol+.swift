//
//  NETunnelProviderProtocol+.swift
//  NetworkExtensionKit
//
//  Created by iran.qiu on 2023/8/26.
//

#if canImport(NetworkExtension)

import Foundation
import NetworkExtension

public extension NETunnelProviderProtocol {
    convenience init(providerBundleIdentifier: String?,
                     serverAddress: String? = nil,
                     disconnectOnSleep: Bool = false,
                     includeAllNetworks: Bool = false,
                     providerConfiguration: [String: Any]? = nil)
    {
        self.init()
        self.providerBundleIdentifier = providerBundleIdentifier
        self.serverAddress = serverAddress
        self.disconnectOnSleep = disconnectOnSleep
        if #available(iOS 14.0, macOS 10.15, *) {
            self.includeAllNetworks = includeAllNetworks
        }
        self.providerConfiguration = providerConfiguration
    }

    var killSwitch: Bool {
        set {
            if #available(iOS 14.0, macOS 10.15, *) {
                self.includeAllNetworks = newValue
            }
        }
        get {
            if #available(iOS 14.0, macOS 10.15, *) {
                return includeAllNetworks
            } else {
                return false
            }
        }
    }
}

#endif
