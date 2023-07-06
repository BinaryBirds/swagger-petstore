import Foundation
import OpenAPIKit30

extension Pet {

    enum Operations {

        static var list: OpenAPI.Operation {
            .init(
                tags: ["Pets"],
                summary: "Find pets",
                description: "List pets and filter by status",
                operationId: "listPets",
                parameters: [
                    .ref("page"),
                    .ref("size"),
                    .ref("search"),
                    .ref("petSort"),
                    .ref("order"),
                ],
                responses: [
                    200: .response(
                        description: "List of pets",
                        content: [
                            .json: .init(
                                schema: Server.Models.list(
                                    reference: "PetList"
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
                tags: ["Pets"],
                summary: "Create a pet",
                description: "Creates a new pet object",
                operationId: "createPet",
                requestBody: .init(content: [
                    .json: .ref("PetCreate")
                ]),
                responses: [
                    200: .response(
                        description: "The details of a pet object",
                        content: [
                            .json: .ref("PetDetail")
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
                tags: ["Pets"],
                summary: "Bulk delete pets",
                description: "Removes multiple pet objects at once",
                operationId: "deletePets",
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
                tags: ["Pets"],
                summary: "Pet details",
                description: "Get the details of a pet object",
                operationId: "getPet",
                parameters: [
                    .ref("petId")
                ],
                responses: [
                    200: .response(
                        description: "The details of a pet object",
                        content: [
                            .json: .ref("PetDetail")
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
                tags: ["Pets"],
                summary: "Update a pet object",
                description: "Updates an entire pet object",
                operationId: "updatePet",
                parameters: [
                    .ref("petId")
                ],
                requestBody: .init(content: [
                    .json: .ref("PetUpdate")
                ]),
                responses: [
                    200: .response(
                        description: "The details of the patched pet object",
                        content: [
                            .json: .ref("PetDetail")
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
                tags: ["Pets"],
                summary: "Patch a pet object",
                description: "Patch the properties of a given pet object",
                operationId: "patchPet",
                parameters: [
                    .ref("petId")
                ],
                requestBody: .init(content: [
                    .json: .ref("PetPatch")
                ]),
                responses: [
                    200: .response(
                        description: "The details of the patched pet object",
                        content: [
                            .json: .ref("PetDetail")
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
                tags: ["Pets"],
                summary: "Delete a pet object",
                description: "Removes a pet object using the unique identifier",
                operationId: "deletePet",
                parameters: [
                    .ref("petId")
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
