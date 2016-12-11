import PackageDescription

let package = Package(
    name: "AoC2016",
    dependencies: [
		.Package(url: "https://github.com/ReactiveX/RxSwift.git", majorVersion: 3),
		.Package(url: "https://github.com/IBM-Swift/CommonCrypto", majorVersion: 0, minor: 1)
    ]
)
