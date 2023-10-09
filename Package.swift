// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

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
      dependencies: []),
    .target(
      name: "OpenMM",
      dependencies: ["COpenMM"]),
  ]
)
