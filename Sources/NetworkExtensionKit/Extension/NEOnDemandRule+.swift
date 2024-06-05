//
//  NEOnDemandRule+.swift
//  NetworkExtensionKit
//
//  Created by iran.qiu on 2023/8/26.
//

#if canImport(NetworkExtension)

import Foundation
import NetworkExtension

public extension NEOnDemandRuleConnect {
    static var `default`: NEOnDemandRuleConnect {
        let rule = NEOnDemandRuleConnect()
        rule.interfaceTypeMatch = .any
        return rule
    }
}

public extension Array where Element == NEOnDemandRule {
    static var defaultConnectRules: [NEOnDemandRule] {
        [NEOnDemandRuleConnect.default]
    }
}

#endif
