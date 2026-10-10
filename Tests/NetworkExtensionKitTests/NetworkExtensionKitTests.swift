import XCTest
import NetworkExtension
@testable import NetworkExtensionKit

final class NetworkExtensionKitTests: XCTestCase {
    func testVPNStatusDescriptions() {
        let statuses: [NEVPNStatus] = [.invalid, .disconnected, .connecting, .connected, .reasserting, .disconnecting]
        XCTAssertEqual(statuses.map(\.description), ["invalid", "disconnected", "connecting", "connected", "reasserting", "disconnecting"])
    }

    func testStopReasonDescriptionsAcrossSDKs() {
        XCTAssertEqual(NEProviderStopReason.none.description, "none")
        XCTAssertEqual(NEProviderStopReason.userInitiated.description, "userInitiated")
        XCTAssertEqual(NEProviderStopReason(rawValue: 17)?.description, "internalError")
        XCTAssertEqual(NEProviderStopReason(rawValue: 999)?.description, "unknown")
    }
}
