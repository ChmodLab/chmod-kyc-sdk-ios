import Foundation

/// Everything needed to start one verification flow.
public struct ChmodKycRequest: Equatable, Sendable {

    /// Base URL of the chmod API the flow talks to.
    public var baseURL: URL

    /// Short-lived token minted by your backend for this transaction.
    public var sdkToken: String

    /// Appearance and behaviour of the flow.
    public var configuration: ChmodKycConfiguration

    public init(
        baseURL: URL,
        sdkToken: String,
        configuration: ChmodKycConfiguration = ChmodKycConfiguration()
    ) {
        self.baseURL = baseURL
        self.sdkToken = sdkToken
        self.configuration = configuration
    }
}
