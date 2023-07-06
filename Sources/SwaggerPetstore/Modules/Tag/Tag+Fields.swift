import Foundation
import OpenAPIKit30

extension Tag {

    enum Fields {

        static func name(required: Bool = true) -> JSONSchema {
            .string(
                required: required,
                description: "Name of the tag",
                example: "Tabby"
            )
        }
    }
}
