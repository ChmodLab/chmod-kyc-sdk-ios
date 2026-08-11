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
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/0.1.6/ChmodKycKit.xcframework.zip",
            checksum: "80aeed281f89f2ea30d80b8392757f6dfaf2612717e732bf840ca1098e5eda62"
        ),
        .binaryTarget(
            name: "iosLivenessBridge",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/0.1.6/iosLivenessBridge.xcframework.zip",
            checksum: "2288bcd14e0db738fe7a398e39bd08074dfd03527b139e281a70611d10c510dc"
        )
    ]
)
