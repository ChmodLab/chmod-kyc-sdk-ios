# chmod KYC SDK for iOS

Compiled releases of the chmod KYC SDK for iOS, as a Swift package. Installing it needs no GitHub
account or token: Swift Package Manager downloads the binaries from this repository's releases.

In Xcode: File › Add Package Dependencies, with `https://github.com/ChmodLab/chmod-kyc-sdk-ios`.
Or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/ChmodLab/chmod-kyc-sdk-ios", exact: "VERSION"),
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [.product(name: "ChmodKyc", package: "chmod-kyc-sdk-ios")]
    ),
]
```

It needs iOS 16 or later. The `chmod-liveness-ios-v…` releases hold the liveness framework the
package depends on: Swift Package Manager fetches it on its own.

Each version is published once and never replaced. This repository is written by chmod's release
pipeline: don't edit it by hand.
