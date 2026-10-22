# chmod KYC SDK for iOS

Compiled releases of the chmod KYC SDK for iOS, as a Swift package. Installing it needs no GitHub
account or token: Swift Package Manager downloads the binaries from this repository's releases.

In Xcode: File › Add Package Dependencies, with `https://github.com/ChmodLab/chmod-kyc-sdk-ios`.
Or in `Package.swift`:

```swift
dependencies: [
    // VERSION: the latest release of this repository, marked Latest.
    .package(url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios", from: "VERSION"),
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [.product(name: "ChmodKyc", package: "chmod-kyc-sdk-ios")]
    ),
]
```

It needs iOS 16 or later; there is no CocoaPods version. The `chmod-liveness-ios-v…` releases hold
the liveness framework the package depends on: Swift Package Manager fetches it on its own.

Then add these keys to the app's `Info.plist`. Without `CADisableMinimumFrameDurationOnPhone` the
flow fails as it opens, and without `NSCameraUsageDescription` iOS closes the app when the camera is
asked for.

```xml
<key>CADisableMinimumFrameDurationOnPhone</key>
<true/>
<key>NSCameraUsageDescription</key>
<string>We need the camera to scan your ID document.</string>
<!-- Only while locationPermission is not .disabled. -->
<key>NSLocationWhenInUseUsageDescription</key>
<string>We use your location to verify your identity.</string>
```

Each version is published once and never replaced. This repository is written by chmod's release
pipeline: don't edit it by hand.
