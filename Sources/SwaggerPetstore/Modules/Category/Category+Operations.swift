import Foundation
import OpenAPIKit30

extension Category {

    enum Operations {

        static var list: OpenAPI.Operation {
            .init(
                tags: ["Categories"],
                summary: "Find categories",
                description: "List categories",
                operationId: "listCategories",
                parameters: [
                    .ref("page"),
                    .ref("size"),
                    .ref("search"),
                    .ref("categorySort"),
                    .ref("order"),
                ],
                responses: [
                    200: .response(
                        description: "List of categories",
                        content: [
                            .json: .init(
                                schema: Server.Models.list(
                                    reference: "CategoryList"
                                )
                            )
                        ]
                    ),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        static var create: OpenAPI.Operation {
            .init(
                tags: ["Categories"],
                summary: "Create a category",
                description: "Creates a new category object",
                operationId: "createCategory",
                requestBody: .init(content: [
                    .json: .ref("CategoryCreate")
                ]),
                responses: [
                    200: .response(
                        description: "The details of a category object",
                        content: [
                            .json: .ref("CategoryDetail")
                        ]
                    ),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        static var bulkDelete: OpenAPI.Operation {
            .init(
                tags: ["Categories"],
                summary: "Bulk delete categories",
                description: "Removes multiple categories objects at once",
                operationId: "deleteCategories",
                requestBody: .init(content: [
                    .json: .init(
                        schema: .array(
                            items: Server.Fields.uuid()
                        )
                    )
                ]),
                responses: [
                    204: .ref("204"),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        // MARK: - currency id

        static var detail: OpenAPI.Operation {
            .init(
                tags: ["Categories"],
                summary: "Category details",
                description: "Get the details of a category object",
                operationId: "getCategory",
                parameters: [
                    .ref("categoryId")
                ],
                responses: [
                    200: .response(
                        description: "The details of a category object",
                        content: [
                            .json: .ref("CategoryDetail")
                        ]
                    ),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                    404: .ref("404"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        static var update: OpenAPI.Operation {
            .init(
                tags: ["Categories"],
                summary: "Update a category object",
                description: "Updates an entire category object",
                operationId: "updateCategory",
                parameters: [
                    .ref("categoryId")
                ],
                requestBody: .init(content: [
                    .json: .ref("CategoryUpdate")
                ]),
                responses: [
                    200: .response(
                        description:
                            "The details of the patched category object",
                        content: [
                            .json: .ref("CategoryDetail")
                        ]
                    ),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        static var patch: OpenAPI.Operation {
            .init(
                tags: ["Categories"],
                summary: "Patch a category object",
                description: "Patch the properties of a given category object",
                operationId: "patchCategory",
                parameters: [
                    .ref("categoryId")
                ],
                requestBody: .init(content: [
                    .json: .ref("CategoryPatch")
                ]),
                responses: [
                    200: .response(
                        description:
                            "The details of the patched category object",
                        content: [
                            .json: .ref("CategoryDetail")
                        ]
                    ),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                    404: .ref("404"),
                ],
                security: Server.Security.bearerAuth
            )
        }

        static var delete: OpenAPI.Operation {
            .init(
                tags: ["Categories"],
                summary: "Delete a category object",
                description:
                    "Removes a category object using the unique identifier",
                operationId: "deleteCategory",
                parameters: [
                    .ref("categoryId")
                ],
                responses: [
                    204: .ref("204"),
                    400: .ref("400"),
                    401: .ref("401"),
                    403: .ref("403"),
                    404: .ref("404"),
                ],
                security: Server.Security.bearerAuth
            )
        }
    }
}
