import Foundation
import OpenAPIKit30

extension Pet {

    enum Parameters {

        static var id: OpenAPI.Parameter {
            .init(
                name: "petId",
                context: .path,
                schema: Server.Fields.uuid()
            )
        }

        static var sort: OpenAPI.Parameter {
            return .init(
                name: "sort",
                context: .query,
                schema: .string(
                    allowedValues: "name",
                    "status",
                    defaultValue: "name",
                    example: "name"
                ),
                description: "Sort with the given value"
            )
        }
    }
}
