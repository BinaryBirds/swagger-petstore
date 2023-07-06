import Foundation
import OpenAPIKit30

extension Category {

    enum Fields {

        static func name(required: Bool = true) -> JSONSchema {
            .string(
                required: required,
                description: "Name of the category",
                example: "Cat"
            )
        }
    }
}
