import Foundation
import OpenAPIKit30
import Yams

let basePath =
    "/"
    + #file
    .split(separator: "/")
    .dropLast(3)
    .joined(separator: "/")
    .appending("/dist")

if !FileManager.default.fileExists(atPath: basePath) {
    try FileManager.default.createDirectory(
        atPath: basePath,
        withIntermediateDirectories: true
    )
}

let doc = OpenAPI.Document.definition
let yamlEncoder = YAMLEncoder()
let yamlData = try yamlEncoder.encode(doc)
let yamlPath = "\(basePath)/swagger.yaml"
try yamlData.write(
    to: URL(fileURLWithPath: yamlPath),
    atomically: true,
    encoding: .utf8
)

let jsonEncoder = JSONEncoder()
jsonEncoder.outputFormatting = [
    .prettyPrinted,
    .withoutEscapingSlashes,
]
let jsonData = try jsonEncoder.encode(doc)
let jsonPath = "\(basePath)/swagger.json"
try jsonData.write(
    to: URL(fileURLWithPath: jsonPath),
    options: .atomic
)
