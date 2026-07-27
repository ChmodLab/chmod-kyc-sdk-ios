// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ChmodKycKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "ChmodKycKit", targets: ["ChmodKycKit"])
    ],
    targets: [
        .binaryTarget(
            name: "ChmodKycKit",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/0.1.2/ChmodKycKit.xcframework.zip",
            checksum: "c0ae33993a81ea1e63bc3510d417d651a502d32ef9e07efa7b3ea63f0579ceca"
        )
    ]
)
