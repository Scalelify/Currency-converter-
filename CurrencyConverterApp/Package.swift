// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "CurrencyConverterApp",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .iOSApplication(
            name: "CurrencyConverterApp",
            targets: ["AppModule"],
            bundleIdentifier: "com.scaleify.currencyconverterapp",
            teamIdentifier: "",
            displayVersion: "1.0",
            bundleVersion: "1",
            iconAssetName: "AppIcon",
            accentColorAssetName: "AccentColor",
            supportedDeviceFamilies: [.phone, .pad],
            supportedInterfaceOrientations: [
                .portrait, .landscapeLeft, .landscapeRight
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: ".",
            exclude: ["Package.swift"],
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency")
            ]
        )
    ]
)