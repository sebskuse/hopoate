// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Hopoate",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12),
        .watchOS(.v5)
    ],
    products: [
      .library(name: "Hopoate", type: .dynamic, targets: ["Hopoate"]),
      .library(name: "HopoateTestingHelpers", type: .dynamic, targets: ["HopoateTestingHelpers"])
    ],
    dependencies: [],
    targets: [
      .target(name: "Hopoate", dependencies: []),
      .target(name: "HopoateTestingHelpers", dependencies: ["Hopoate"]),
      .testTarget(name: "HopoateTests", dependencies: ["Hopoate"])
    ],
    swiftLanguageVersions: [.v5]
)
