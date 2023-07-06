import Foundation
import OpenAPIKit30

extension Category {

    enum Parameters {

        static var id: OpenAPI.Parameter {
            .init(
                name: "categoryId",
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
                    defaultValue: "name",
                    example: "name"
                ),
                description: "Sort with the given value"
            )
        }
    }
}
