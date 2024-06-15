//
//  Bundle+.swift
//  NetworkExtensionKit
//
//  Created by CodingIran on 2024/6/15.
//

import Foundation

public extension Bundle {
    var extensionMachServiceName: String? {
        guard
            let networkExtensionKeys = object(forInfoDictionaryKey: "NetworkExtension") as? [String: Any],
            let machServiceName = networkExtensionKeys["NEMachServiceName"] as? String
        else {
            return nil
        }
        return machServiceName
    }
}
