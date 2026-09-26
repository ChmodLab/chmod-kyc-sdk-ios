// swift-tools-version:5.9
import PackageDescription

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
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/0.0.39/ChmodKycKit.xcframework.zip",
            checksum: "136027525adda90f69f168a35a1eac70175c702a0f60f034003587aee7873ec6"
        ),
        .binaryTarget(
            name: "ChmodLivenessIOS",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/chmod-liveness-ios-v1.0.0/ChmodLivenessIOS.xcframework.zip",
            checksum: "a1e9b230e37ba854edc873f85b9316be45a0994ecad8fa243adcd204c6b97cc4"
        )
    ]
)
