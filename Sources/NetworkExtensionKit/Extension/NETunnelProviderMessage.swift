//
//  VPNMessage.swift
//  NetworkExtensionKit
//
//  Created by CodingIran on 2024/5/31.
//

import Foundation

public enum NETunnelProviderMessageError: LocalizedError {
    case tunnelProviderSessionUnavailable
    case messageDataConvertError

    public var errorDescription: String? {
        switch self {
        case .tunnelProviderSessionUnavailable:
            return "NETunnelProviderSession unavailable"
        case .messageDataConvertError:
            return "Message data convert error"
        }
    }
}

public protocol NETunnelProviderMessaging {
    var messageData: Data? { get }
    init?(messageData: Data)
}

extension Data: NETunnelProviderMessaging {
    public var messageData: Data? {
        self
    }

    public init?(messageData: Data) {
        self = messageData
    }
}

extension String: NETunnelProviderMessaging {
    public var messageData: Data? {
        self.data(using: .utf8)
    }

    public init?(messageData: Data) {
        guard let data = String(data: messageData, encoding: .utf8) else {
            return nil
        }
        self = data
    }
}

extension Dictionary: NETunnelProviderMessaging where Key == String, Value == Any {
    public var messageData: Data? {
        try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }

    public init?(messageData: Data) {
        guard let data = try? JSONSerialization.jsonObject(with: messageData, options: []) as? [String: Any] else {
            return nil
        }
        self = data
    }
}

#if canImport(NetworkExtension)

import NetworkExtension

#if swift(>=5.5)
#if canImport(_Concurrency)

public extension NETunnelProviderManager {
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    func sendMessage<T>(_ message: NETunnelProviderMessaging) async throws -> T? where T: NETunnelProviderMessaging {
        guard let session = connection as? NETunnelProviderSession
        else {
            throw NETunnelProviderMessageError.tunnelProviderSessionUnavailable
        }

        guard let messageData = message.messageData else {
            throw NETunnelProviderMessageError.messageDataConvertError
        }
        guard let responseData = try await session.sendProviderMessage(messageData) else {
            return nil
        }
        return T(messageData: responseData)
    }
}

#endif
#endif

#endif
