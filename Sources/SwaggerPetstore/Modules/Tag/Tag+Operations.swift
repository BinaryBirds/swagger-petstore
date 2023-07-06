import Foundation
import OpenAPIKit30

extension Tag {

    enum Operations {

        static var list: OpenAPI.Operation {
            .init(
                tags: ["Tags"],
                summary: "Find tags",
                description: "List tags",
                operationId: "listTags",
                parameters: [
                    .ref("page"),
                    .ref("size"),
                    .ref("search"),
                    .ref("tagSort"),
                    .ref("order"),
                ],
                responses: [
                    200: .response(
                        description: "List of tags",
                        content: [
                            .json: .init(
                                schema: Server.Models.list(
                                    reference: "TagList"
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
                tags: ["Tags"],
                summary: "Create a tag",
                description: "Creates a new tag object",
                operationId: "createTag",
                requestBody: .init(content: [
                    .json: .ref("TagCreate")
                ]),
                responses: [
                    200: .response(
                        description: "The details of a tag object",
                        content: [
                            .json: .ref("TagDetail")
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
                tags: ["Tags"],
                summary: "Bulk delete tags",
                description: "Removes multiple tag objects at once",
                operationId: "deleteTags",
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
                tags: ["Tags"],
                summary: "Tag details",
                description: "Get the details of a tag object",
                operationId: "getTag",
                parameters: [
                    .ref("tagId")
                ],
                responses: [
                    200: .response(
                        description: "The details of a tag object",
                        content: [
                            .json: .ref("TagDetail")
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
                tags: ["Tags"],
                summary: "Update a tag object",
                description: "Updates an entire tag object",
                operationId: "updateTag",
                parameters: [
                    .ref("tagId")
                ],
                requestBody: .init(content: [
                    .json: .ref("TagUpdate")
                ]),
                responses: [
                    200: .response(
                        description: "The details of the patched tag object",
                        content: [
                            .json: .ref("TagDetail")
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
                tags: ["Tags"],
                summary: "Patch a tag object",
                description: "Patch the properties of a given tag object",
                operationId: "patchTag",
                parameters: [
                    .ref("tagId")
                ],
                requestBody: .init(content: [
                    .json: .ref("TagPatch")
                ]),
                responses: [
                    200: .response(
                        description: "The details of the patched tag object",
                        content: [
                            .json: .ref("TagDetail")
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
                tags: ["Tags"],
                summary: "Delete a tag object",
                description: "Removes a tag object using the unique identifier",
                operationId: "deleteTag",
                parameters: [
                    .ref("tagId")
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
