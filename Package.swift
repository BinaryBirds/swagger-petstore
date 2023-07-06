// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "swagger-petstore",
    platforms: [
        .macOS(.v10_15),
    ],
    dependencies: [
        .package(
            url: "https://github.com/mattpolzin/OpenAPIKit",
            from: "3.0.0-alpha.8"
        ),
        .package(
            url: "https://github.com/jpsim/Yams",
            from: "5.0.6"
        ),
    ],
    targets: [
        .executableTarget(
            name: "SwaggerPetstore",
            dependencies: [
                .product(name: "OpenAPIKit30", package: "OpenAPIKit"),
                .product(name: "Yams", package: "Yams"),
            ]
        )
    ]
)
