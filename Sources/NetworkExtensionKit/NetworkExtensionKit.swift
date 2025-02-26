//
//  NetworkExtensionKit.swift
//  NetworkExtensionKit
//
//  Created by iran.qiu on 2023/8/28.
//

import Foundation

// Enforce minimum Swift version for all platforms and build systems.
#if swift(<5.9)
#error("NetworkExtensionKit doesn't support Swift versions below 5.9.")
#endif

/// Current NetworkExtensionKit version 0.1.3. Necessary since SPM doesn't use dynamic libraries. Plus this will be more accurate.
let version = "0.1.3"
