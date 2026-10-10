# NetworkExtensionKit

NetworkExtensionKit is a Swift package that provides convenient extensions and utilities for working with Apple's NetworkExtension framework. It simplifies the implementation of VPN and network tunneling features in iOS and macOS applications.

## Features

- Convenient extensions for NetworkExtension classes
- Type-safe configuration builders
- Async/await support for modern Swift concurrency
- Objective-C interoperability
- Support for iOS 13+, macOS 10.15+, and tvOS 17+

## Installation

### Swift Package Manager

Add the following dependency to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/codingiran/NetworkExtensionKit.git", from: "0.0.9")
]
```

## Requirements

- iOS 13.0+
- macOS 10.15+
- tvOS 17.0+
- Xcode 15.4+
- Swift 5.10+

Swift 5.10 uses `Package@swift-5.10.swift` in Swift 5 language mode; Swift 6 uses `Package.swift` in Swift 6 language mode. Sources conditionally use `@retroactive` and decode the newer `internalError` stop reason without requiring a newer SDK symbol. This compatibility revision must be published before remote consumers can use it.

## License

[MIT License](LICENSE)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
