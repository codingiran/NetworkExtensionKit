//
//  NEVPNManager+.swift
//  NetworkExtensionKit
//
//  Created by iran.qiu on 2023/8/26.
//

#if canImport(NetworkExtension)

import Foundation
import NetworkExtension

public extension NEVPNManager {
    func save(wait seconds: TimeInterval? = nil) async throws {
        try await saveToPreferences()
        if let seconds {
            try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
        }
    }
}

#endif
