//
//  NETunnelProviderManager+.swift
//  NetworkExtensionKit
//
//  Created by iran.qiu on 2023/8/26.
//

#if canImport(NetworkExtension)

import Foundation
import NetworkExtension

public extension NETunnelProviderManager {
    convenience init(localizedDescription: String?,
                     isOnDemandEnabled: Bool = false,
                     onDemandRules: [NEOnDemandRule]? = nil,
                     protocolConfiguration: NEVPNProtocol? = nil)
    {
        self.init()
        self.localizedDescription = localizedDescription
        self.isOnDemandEnabled = isOnDemandEnabled
        self.onDemandRules = onDemandRules
        self.protocolConfiguration = protocolConfiguration
    }

    static func installedManagers() async throws -> [NETunnelProviderManager] {
        try await NETunnelProviderManager.loadAllFromPreferences()
    }

    static func installedManager(with providerBundleIdentifier: String) async throws -> NETunnelProviderManager? {
        let managers = try await installedManagers()
        guard let manager = managers.first(where: { $0.providerBundleIdentifier == providerBundleIdentifier }) else { return nil }
        return manager
    }

    func uninstall() async throws {
        if connection.status != .disconnected {
            connection.stopVPNTunnel()
        }
        try await removeFromPreferences()
    }
}

// MARK: - NEVPNProtocol Wrapper

public extension NETunnelProviderManager {
    var tunnelProviderProtocol: NETunnelProviderProtocol? {
        set { protocolConfiguration = newValue }
        get { protocolConfiguration as? NETunnelProviderProtocol }
    }

    var providerConfiguration: [String: Any]? {
        set { tunnelProviderProtocol?.providerConfiguration = newValue }
        get { tunnelProviderProtocol?.providerConfiguration }
    }

    var providerBundleIdentifier: String? {
        set { tunnelProviderProtocol?.providerBundleIdentifier = newValue }
        get { tunnelProviderProtocol?.providerBundleIdentifier }
    }

    var disconnectOnSleep: Bool {
        set { protocolConfiguration?.disconnectOnSleep = newValue }
        get { protocolConfiguration?.disconnectOnSleep ?? false }
    }

    @available(macOS 10.15, iOS 14.0, *)
    var includeAllNetworks: Bool {
        set { protocolConfiguration?.includeAllNetworks = newValue }
        get { protocolConfiguration?.includeAllNetworks ?? false }
    }

    @available(macOS 10.15, iOS 14.2, *)
    var excludeLocalNetworks: Bool {
        set { protocolConfiguration?.excludeLocalNetworks = newValue }
        get { protocolConfiguration?.excludeLocalNetworks ?? false }
    }

    @available(macOS 13.3, iOS 16.4, *)
    var excludeCellularServices: Bool {
        set { protocolConfiguration?.excludeCellularServices = newValue }
        get { protocolConfiguration?.excludeCellularServices ?? false }
    }

    @available(macOS 13.3, iOS 16.4, *)
    var excludeAPNs: Bool {
        set { protocolConfiguration?.excludeAPNs = newValue }
        get { protocolConfiguration?.excludeAPNs ?? false }
    }

    @available(macOS 11.0, iOS 14.2, *)
    var enforceRoutes: Bool {
        set { protocolConfiguration?.enforceRoutes = newValue }
        get { protocolConfiguration?.enforceRoutes ?? false }
    }
}

#endif
