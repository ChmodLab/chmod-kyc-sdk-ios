import Foundation

public struct ChmodKycRequest: Equatable, Sendable {

    public var baseURL: URL

    public var sdkToken: String

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
