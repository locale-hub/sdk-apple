// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "LocaleHubApple",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "LocaleHubSwiftUI",
            targets: ["LocaleHubSwiftUI"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/locale-hub/sdk-swift.git", from: "3.5.0"),
    ],
    targets: [
        .target(
            name: "LocaleHubSwiftUI",
            dependencies: [
                .product(name: "LocaleHubSDK", package: "sdk-swift")
            ]
        ),
    ]
)
