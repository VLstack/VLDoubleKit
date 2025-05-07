// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "VLDoubleKit",
                      platforms: [ .iOS(.v17) ],
                      products:
                      [
                       .library(name: "VLDoubleKit",
                                targets: [ "VLDoubleKit" ])
                      ],
                      targets:
                      [
                       .target(name: "VLDoubleKit"),
                       .testTarget(name: "VLDoubleKitTests",
                                   dependencies: [ "VLDoubleKit" ])
                      ])
