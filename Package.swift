// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import class Foundation.ProcessInfo

var linkerSettings: [LinkerSetting] = []

// Example: "/Users/philipturner/miniforge3/lib"
if let path = ProcessInfo.processInfo.environment["OPENMM_LIBRARY_PATH"] {
  linkerSettings = [
    .unsafeFlags(["-L\(path)"]),
    .linkedLibrary("OpenMM"),
    .linkedLibrary("c++")
  ]
}

let package = Package(
  name: "swift-openmm",
  products: [
    .library(
      name: "COpenMM",
      targets: ["COpenMM"]),
    .library(
      name: "OpenMM",
      targets: ["OpenMM"]),
  ],
  targets: [
    .target(
      name: "COpenMM",
      dependencies: [],
      linkerSettings: linkerSettings),
    .target(
      name: "OpenMM",
      dependencies: ["COpenMM"]),
  ]
)
