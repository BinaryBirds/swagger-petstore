import Foundation
import OpenAPIKit30

extension Server {

    enum Parameters {

        static var page: OpenAPI.Parameter {
            let name = "page"
            return .init(
                name: name,
                context: .query,
                schema: .integer(
                    title: name,
                    minimum: (1, exclusive: false),
                    defaultValue: 1,
                    example: 1
                ),
                description: "Page offset of the list"
            )
        }

        static var size: OpenAPI.Parameter {
            let name = "size"
            return .init(
                name: name,
                context: .query,
                schema: .integer(
                    title: name,
                    minimum: (1, exclusive: false),
                    defaultValue: 50,
                    example: 50
                ),
                description: "Number of items per page"
            )
        }

        static var search: OpenAPI.Parameter {
            let name = "search"
            return .init(
                name: name,
                context: .query,
                schema: .string(
                    example: ""
                ),
                description: "Search with some value"
            )
        }

        static var order: OpenAPI.Parameter {
            .init(
                name: "order",
                context: .query,
                schema: .string(
                    allowedValues: "asc",
                    "desc",
                    defaultValue: "asc",
                    example: "asc"
                ),
                description:
                    "Order the results ascending or descending (asc, desc)"
            )
        }
    }
}
