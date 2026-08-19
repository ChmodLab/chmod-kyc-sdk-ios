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
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/1.0.13/ChmodKycKit.xcframework.zip",
            checksum: "e1f2933960b7da4222a6ec039fd112b3022e086b78a646fca4dbbf6e23f3b273"
        ),
        .binaryTarget(
            name: "ChmodLivenessIOS",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/chmod-liveness-ios-v1.0.0/ChmodLivenessIOS.xcframework.zip",
            checksum: "a1e9b230e37ba854edc873f85b9316be45a0994ecad8fa243adcd204c6b97cc4"
        )
    ]
)
