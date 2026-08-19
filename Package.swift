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
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/1.0.12/ChmodKycKit.xcframework.zip",
            checksum: "3688994068486ed0f659983dcd3a4e4ae1b595d0ad99ffe72859cb791030b1c1"
        ),
        .binaryTarget(
            name: "ChmodLivenessIOS",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/chmod-liveness-ios-v1.0.0/ChmodLivenessIOS.xcframework.zip",
            checksum: "a1e9b230e37ba854edc873f85b9316be45a0994ecad8fa243adcd204c6b97cc4"
        )
    ]
)
