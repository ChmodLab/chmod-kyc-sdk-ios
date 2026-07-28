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
            url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios/releases/download/0.1.4/ChmodKycKit.xcframework.zip",
            checksum: "b128e9af9b5374b89b875c3ada5769e75654127381a1c05bec6b8eacf68eae48"
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
