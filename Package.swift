// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ChmodKycKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "ChmodKycKit", targets: ["ChmodKycKit", "iosLivenessBridge"])
    ],
    targets: [
        .binaryTarget(
            name: "ChmodKycKit",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/0.1.5/ChmodKycKit.xcframework.zip",
            checksum: "581b894ea7018dcd30d3d6a93f82537a84a36fcf0fe7f6023af6ce87056a452e"
        ),
        .binaryTarget(
            name: "iosLivenessBridge",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/0.1.5/iosLivenessBridge.xcframework.zip",
            checksum: "4d2d4e1d26611deaad6d41259c999ee94d11dfb53d7377becec9e3454c4d6a62"
        )
    ]
)
