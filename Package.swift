// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ChmodKycKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "ChmodKycKit", targets: ["ChmodKycKit", "ChmodLivenessIOS"])
    ],
    targets: [
        .binaryTarget(
            name: "ChmodKycKit",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/1.0.9/ChmodKycKit.xcframework.zip",
            checksum: "3365a9d83f8ef8c6eb3f35e5d9d5f0f56977a3efc8dc0962871591ba67b5f87a"
        ),
        .binaryTarget(
            name: "ChmodLivenessIOS",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/liveness-bridge-v1.0.0/ChmodLivenessIOS.xcframework.zip",
            checksum: "e257430bf754cdb5a16c3aea4e203e7f1ee4c6ee635a62eb504fba7529fe2216"
        )
    ]
)
