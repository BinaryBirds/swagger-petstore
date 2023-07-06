import Foundation
import OpenAPIKit30

extension Server {

    enum Models {

        static var error: JSONSchema {
            .object(
                properties: [
                    "message": .string(
                        required: true,
                        description: "The user facing error message",
                        example: "Something went wrong with the request."
                    ),
                    "details": .array(
                        items: .object(
                            properties: [
                                "key": .string(
                                    required: true,
                                    description: "The error key",
                                    example: "field"
                                ),
                                "message": .string(
                                    required: true,
                                    description:
                                        "The user facing error message",
                                    example:
                                        "Something is wrong with the field."
                                ),
                            ]
                        )
                    ),
                ]
            )
        }

        static func page() -> JSONSchema {
            .object(
                properties: [
                    "size": .integer(
                        required: true,
                        maximum: (1000, exclusive: false),
                        minimum: (10, exclusive: false),
                        defaultValue: 50,
                        example: 25
                    ),
                    "current": .integer(
                        required: true,
                        minimum: (0, exclusive: false),
                        defaultValue: 0,
                        example: 12
                    ),
                    "total": .integer(
                        required: true,
                        minimum: (0, exclusive: false),
                        defaultValue: 0,
                        example: 42
                    ),
                ]
            )
        }

        static func list(
            reference: String,
            orderKeys: [String]? = nil
        ) -> JSONSchema {
            .object(
                properties: [
                    "items": .array(
                        items: .reference(.component(named: reference))
                    ),
                    "metadata": .object(
                        properties: [
                            "page": Self.page(),
                            "items": .object(
                                properties: [
                                    "total": .integer(
                                        required: true,
                                        minimum: (0, exclusive: false),
                                        defaultValue: 0,
                                        example: 69
                                    )
                                ]
                            ),
                            "sort": .object(
                                properties: [
                                    "by": .string(
                                        required: false,
                                        description:
                                            "Sort the list by ascending or descending order",
                                        allowedValues: "asc",
                                        "desc",
                                        defaultValue: "asc"
                                    ),
                                    "order": .string(
                                        required: false,
                                        description:
                                            "Field key to order the list",
                                        allowedValues: orderKeys
                                            as? [AnyCodable]
                                    ),
                                ]
                            ),
                            "search": .string(
                                required: false,
                                description: "Search term"
                            ),
                        ]
                    ),
                ]
            )
        }
    }
}
