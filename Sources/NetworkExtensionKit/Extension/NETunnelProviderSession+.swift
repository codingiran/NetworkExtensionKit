//
//  NETunnelProviderSession+.swift
//  NetworkExtensionKit
//
//  Created by iran.qiu on 2023/6/19.
//

#if canImport(NetworkExtension)

import Foundation
import NetworkExtension

#if swift(>=5.5)
#if canImport(_Concurrency)

public extension NETunnelProviderSession {
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    func sendProviderMessage(_ messageData: Data) async throws -> Data? {
        return try await withCheckedThrowingContinuation { [self] cont in
            do {
                try self.sendProviderMessage(messageData) { responseData in
                    cont.resume(returning: responseData)
                }
            } catch {
                cont.resume(throwing: error)
            }
        }
    }
}

#endif
#endif

#endif
