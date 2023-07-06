import Foundation
import OpenAPIKit30

extension Pet {

    enum Fields {

        static func name(required: Bool = true) -> JSONSchema {
            .string(
                required: required,
                description: "Name of the pet",
                example: "Lucky"
            )
        }

        static func status(required: Bool = true) -> JSONSchema {
            .string(
                required: required,
                description: "Pet status in the store",
                allowedValues: "available",
                "pending",
                "sold",
                defaultValue: "available"
            )
        }
    }
}
