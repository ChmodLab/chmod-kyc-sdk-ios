// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ChmodKycKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "ChmodKycKit", targets: ["ChmodKycKit", "ChmodKycKitResources"])
    ],
    targets: [
        .binaryTarget(
            name: "ChmodKycKit",
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/0.1.3/ChmodKycKit.xcframework.zip",
            checksum: "768e887e0facdda25e4072391e566484a90202a520b1f0f0276920e40ed4894c"
        ),
        .target(
            name: "ChmodKycKitResources",
            path: "Sources/ChmodKycKitResources",
            resources: [
                .copy("Resources/Amplify_Amplify.bundle"),
                .copy("Resources/Amplify_AWSCognitoAuthPlugin.bundle"),
                .copy("Resources/Amplify_AWSPluginsCore.bundle"),
                .copy("Resources/Amplify_AWSPredictionsPlugin.bundle"),
                .copy("Resources/Amplify_CoreMLPredictionsPlugin.bundle"),
                .copy("Resources/Amplify_InternalAmplifyCredentials.bundle"),
                .copy("Resources/AmplifyUILiveness_FaceLiveness.bundle"),
                .copy("Resources/aws-crt-swift_AwsCommonRuntimeKit.bundle"),
                .copy("Resources/aws-sdk-swift_AWSClientRuntime.bundle"),
                .copy("Resources/smithy-swift_ClientRuntime.bundle"),
                .copy("Resources/SwiftProtobuf_SwiftProtobuf.bundle"),
            ]
        )
    ]
)
