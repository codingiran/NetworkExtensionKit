//
//  NEPacketTunnelNetworkSettings+.swift
//  NetworkExtensionKit
//
//  Created by iran.qiu on 2023/8/26.
//

#if canImport(NetworkExtension)

import NetworkExtension

public extension NEPacketTunnelNetworkSettings {
    struct Ipv4Config {
        public var addresses: [String]
        public var subnetMasks: [String]
        public var includedRoutes: [NEIPv4Route]?
        public var excludedRoutes: [NEIPv4Route]?

        public init(addresses: [String],
                    subnetMasks: [String],
                    includedRoutes: [NEIPv4Route]? = nil,
                    excludedRoutes: [NEIPv4Route]? = nil)
        {
            self.addresses = addresses
            self.subnetMasks = subnetMasks
            self.includedRoutes = includedRoutes
            self.excludedRoutes = excludedRoutes
        }
    }

    struct Ipv6Config {
        public var addresses: [String]
        public var networkPrefixLengths: [UInt]
        public var includedRoutes: [NEIPv6Route]?
        public var excludedRoutes: [NEIPv6Route]?

        public init(addresses: [String],
                    networkPrefixLengths: [UInt],
                    includedRoutes: [NEIPv6Route]? = nil,
                    excludedRoutes: [NEIPv6Route]? = nil)
        {
            self.addresses = addresses
            self.networkPrefixLengths = networkPrefixLengths
            self.includedRoutes = includedRoutes
            self.excludedRoutes = excludedRoutes
        }
    }

    struct DNSConfig {
        public var servers: [String]
        public var matchDomains: [String]?

        public init(servers: [String], matchDomains: [String]? = nil) {
            self.servers = servers
            self.matchDomains = matchDomains
        }
    }

    struct ProxyConfig {
        public var httpServerAddress: String?
        public var httpServerPort: Int?
        public var httpsServerAddress: String?
        public var httpsServerPort: Int?
        public var excludeSimpleHostnames: Bool?
        public var exceptionList: [String]?
        public var matchDomains: [String]?

        public init(httpServerAddress: String?,
                    httpServerPort: Int?,
                    httpsServerAddress: String?,
                    httpsServerPort: Int?)
        {
            self.httpServerAddress = httpServerAddress
            self.httpServerPort = httpServerPort
            self.httpsServerAddress = httpsServerAddress
            self.httpsServerPort = httpsServerPort
        }
    }

    convenience init(remoteAddress: String,
                     ipv4Config: Ipv4Config? = nil,
                     ipv6Config: Ipv6Config? = nil,
                     dnsConfig: DNSConfig? = nil,
                     proxyConfig: ProxyConfig? = nil,
                     mtu: UInt = 1500)
    {
        self.init(tunnelRemoteAddress: remoteAddress)
        if let ipv4Config {
            let ipv4Settings = NEIPv4Settings(addresses: ipv4Config.addresses, subnetMasks: ipv4Config.subnetMasks)
            ipv4Settings.includedRoutes = ipv4Config.includedRoutes
            ipv4Settings.excludedRoutes = ipv4Config.excludedRoutes
            self.ipv4Settings = ipv4Settings
        }
        if let ipv6Config {
            let ipv6Settings = NEIPv6Settings(addresses: ipv6Config.addresses, networkPrefixLengths: ipv6Config.networkPrefixLengths.map { NSNumber(value: $0) })
            ipv6Settings.includedRoutes = ipv6Config.includedRoutes
            ipv6Settings.excludedRoutes = ipv6Config.excludedRoutes
            self.ipv6Settings = ipv6Settings
        }
        if let dnsConfig {
            let dnsSettings = NEDNSSettings(servers: dnsConfig.servers)
            dnsSettings.matchDomains = dnsConfig.matchDomains
            self.dnsSettings = dnsSettings
        }
        if let proxyConfig {
            let proxySettings = NEProxySettings()
            if let httpServerAddress = proxyConfig.httpServerAddress,
               let httpServerPort = proxyConfig.httpServerPort
            {
                proxySettings.httpEnabled = true
                proxySettings.httpServer = NEProxyServer(address: httpServerAddress, port: httpServerPort)
            }
            if let httpsServerAddress = proxyConfig.httpsServerAddress,
               let httpsServerPort = proxyConfig.httpsServerPort
            {
                proxySettings.httpsEnabled = true
                proxySettings.httpsServer = NEProxyServer(address: httpsServerAddress, port: httpsServerPort)
            }
            if let excludeSimpleHostnames = proxyConfig.excludeSimpleHostnames {
                proxySettings.excludeSimpleHostnames = excludeSimpleHostnames
            }
            if let exceptionList = proxyConfig.exceptionList {
                proxySettings.exceptionList = exceptionList
            }
            if let matchDomains = proxyConfig.matchDomains {
                proxySettings.matchDomains = matchDomains
            }
            self.proxySettings = proxySettings
        }
        self.mtu = NSNumber(value: mtu)
    }
}

public extension Array where Element == NEIPv4Route {
    static var defaultIpv4Routes: [NEIPv4Route] { [NEIPv4Route.default()] }
}

public extension Array where Element == NEIPv6Route {
    static var defaultIpv6Routes: [NEIPv6Route] { [NEIPv6Route.default()] }
}

#endif
