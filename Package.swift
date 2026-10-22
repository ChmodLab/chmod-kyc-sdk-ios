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
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/1.0.0/ChmodKycKit.xcframework.zip",
            checksum: "54a9153db41fcc74bac2762cfc5fe83bcaf8087564a5582a740864211f069cc2"
        ),
        .binaryTarget(
            name: "ChmodLivenessIOS",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/chmod-liveness-ios-v1.0.0/ChmodLivenessIOS.xcframework.zip",
            checksum: "26cef99b946aca5d37a940ccf4867ec8589b571786dfac4690990b0f14caf048"
        )
    ]
)
