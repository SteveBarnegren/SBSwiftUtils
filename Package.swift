// swift-tools-version:5.1
import PackageDescription

let package = Package(name: "SBSwiftUtils",
                      platforms: [.macOS(.v10_12),
                                  .iOS(.v10)],
                      products: [.library(name: "SBSwiftUtils",
                                          targets: ["SBSwiftUtils"])],
                      targets: [.target(name: "SBSwiftUtils",
                                        path: "SBSwiftUtils"),
                                .testTarget(name: "SBSwiftUtilsTests",
                                            dependencies: ["SBSwiftUtils"],
                                            path: "Tests")],
                      swiftLanguageVersions: [.v5])
