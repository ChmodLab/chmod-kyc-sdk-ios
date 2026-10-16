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
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/0.0.43/ChmodKycKit.xcframework.zip",
            checksum: "5690655f74ea4352bd26dd9bedbec9541852996658c744d9e0bed54714766dec"
        ),
        .binaryTarget(
            name: "ChmodLivenessIOS",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/chmod-liveness-ios-v1.0.3/ChmodLivenessIOS.xcframework.zip",
            checksum: "8c569f7f1ee12f22fe3ce9cd09ae51090e5f2922d09564d5b6e9f5d1045eec4f"
        )
    ]
)
