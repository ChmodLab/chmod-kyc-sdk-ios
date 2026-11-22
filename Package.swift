// swift-tools-version:5.9
import PackageDescription

// Public repo: SwiftPM resolves it, binaries included, with no token.
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
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/chmod-kyc-sdk-ios-v1.0.0/ChmodKycKit.xcframework.zip",
            checksum: "1a1c5a046e903454cdc5533eb2549946b4305fa31b1a00e5743c92f6c1283c5f"
        ),
        .binaryTarget(
            name: "ChmodLivenessIOS",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/chmod-liveness-ios-v1.0.0/ChmodLivenessIOS.xcframework.zip",
            checksum: "15d3eeab70e881337340d9ea6a9ce608646c1d6abbe11133c10638f6fc29d847"
        )
    ]
)
