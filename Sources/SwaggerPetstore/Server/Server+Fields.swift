import Foundation
import OpenAPIKit30

extension Server {

    enum Fields {

        static func uuid(
            required: Bool = true,
            description: String = "Unique identifier"
        ) -> JSONSchema {
            .string(
                format: .extended(.uuid),
                required: required,
                description: description,
                example: "4DB59768-CDFA-4608-BA60-4673A3CB015E"
            )
        }

        static func url(
            required: Bool = true,
            description: String = "URL"
        ) -> JSONSchema {
            .string(
                format: .extended(.uri),
                required: required,
                description: description,
                example: "https://placekitten.com/512/512"
            )
        }
    }
}
