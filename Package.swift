// swift-tools-version:5.9
import PackageDescription

// Private repo: resolving needs a token with contents:read on it, through
// the Xcode GitHub account or ~/.netrc (machine api.github.com).
let package = Package(
    name: "ChmodKyc",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "ChmodKyc", targets: ["ChmodKyc"])
    ],
    targets: [
        .target(
            name: "ChmodKyc",
            dependencies: ["ChmodKycKit", "ChmodLivenessIOS"]
        ),
        .binaryTarget(
            name: "ChmodKycKit",
            url: "https://api.github.com/repos/ChmodLab/chmod-kyc-sdk-ios/releases/assets/648657430.zip",
            checksum: "c345022b52eb99689444930fb16f4c9fcbf0ddfa93bfed70095b6f59469eb97d"
        ),
        .binaryTarget(
            name: "ChmodLivenessIOS",
            url: "https://api.github.com/repos/ChmodLab/chmod-kyc-sdk-ios/releases/assets/608281554.zip",
            checksum: "8c569f7f1ee12f22fe3ce9cd09ae51090e5f2922d09564d5b6e9f5d1045eec4f"
        )
    ]
)
