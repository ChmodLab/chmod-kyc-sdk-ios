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
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/0.0.33/ChmodKycKit.xcframework.zip",
            checksum: "5259db8daade7c6b795d29a498e5f72cea731c7b7ac676529417b018f797417c"
        ),
        .binaryTarget(
            name: "ChmodLivenessIOS",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/chmod-liveness-ios-v1.0.0/ChmodLivenessIOS.xcframework.zip",
            checksum: "a1e9b230e37ba854edc873f85b9316be45a0994ecad8fa243adcd204c6b97cc4"
        )
    ]
)
