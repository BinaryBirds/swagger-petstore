import OpenAPIKit30

extension OpenAPI.Document {

    static var definition: OpenAPI.Document {
        .init(
            info: .init(
                title: "Swagger Petstore - written in Swift",
                description:
                    "This is a sample Pet Store Server based on the OpenAPI 3.0 specification generated using Swift & OpenAPIKit.",
                contact: .init(
                    name: "Binary Birds",
                    url: .init(string: "https://binarybirds.com")!,
                    email: "info@binarybirds.com"
                ),
                version: "1.0.0"
            ),
            servers: [
                .init(
                    url: .init(string: "http://127.0.0.1:8080")!,
                    description: "dev"
                ),
                .init(
                    url: .init(string: "http://127.0.0.1:8081")!,
                    description: "live"
                ),
            ],
            paths: [
                "/categories": .init(
                    get: Category.Operations.list,
                    post: Category.Operations.create,
                    delete: Category.Operations.bulkDelete
                ),
                "/categories/{categoryId}": .init(
                    get: Category.Operations.detail,
                    put: Category.Operations.update,
                    delete: Category.Operations.delete,
                    patch: Category.Operations.patch
                ),

                "/tags": .init(
                    get: Tag.Operations.list,
                    post: Tag.Operations.create,
                    delete: Tag.Operations.bulkDelete
                ),
                "/tags/{tagId}": .init(
                    get: Tag.Operations.detail,
                    put: Tag.Operations.update,
                    delete: Tag.Operations.delete,
                    patch: Tag.Operations.patch
                ),

                "/pets": .init(
                    get: Pet.Operations.list,
                    post: Pet.Operations.create,
                    delete: Pet.Operations.bulkDelete
                ),
                "/pets/{petId}": .init(
                    get: Pet.Operations.detail,
                    put: Pet.Operations.update,
                    delete: Pet.Operations.delete,
                    patch: Pet.Operations.patch
                ),
            ],
            components: .init(
                schemas: [
                    "ErrorResponse": Server.Models.error,

                    "CategoryReference": Category.Components.reference,
                    "CategoryList": Category.Components.list,
                    "CategoryDetail": Category.Components.detail,
                    "CategoryCreate": Category.Components.create,
                    "CategoryUpdate": Category.Components.update,
                    "CategoryPatch": Category.Components.patch,

                    "TagReference": Tag.Components.reference,
                    "TagList": Tag.Components.list,
                    "TagDetail": Tag.Components.detail,
                    "TagCreate": Tag.Components.create,
                    "TagUpdate": Tag.Components.update,
                    "TagPatch": Tag.Components.patch,

                    "PetReference": Pet.Components.reference,
                    "PetList": Pet.Components.list,
                    "PetDetail": Pet.Components.detail,
                    "PetCreate": Pet.Components.create,
                    "PetUpdate": Pet.Components.update,
                    "PetPatch": Pet.Components.patch,
                ],
                responses: [
                    "204": .init(description: "No content"),
                    "400": .init(
                        description: "Bad request",
                        content: [
                            .json: .init(
                                schema: .reference(
                                    .component(named: "ErrorResponse")
                                )
                            )
                        ]
                    ),
                    "401": .init(
                        description: "Unauthorized",
                        content: [
                            .json: .init(
                                schema: .reference(
                                    .component(named: "ErrorResponse")
                                )
                            )
                        ]
                    ),
                    "403": .init(
                        description: "Forbidden",
                        content: [
                            .json: .init(
                                schema: .reference(
                                    .component(named: "ErrorResponse")
                                )
                            )
                        ]
                    ),
                    "404": .init(
                        description: "Not found",
                        content: [
                            .json: .init(
                                schema: .reference(
                                    .component(named: "ErrorResponse")
                                )
                            )
                        ]
                    ),
                ],
                parameters: [
                    "categoryId": Category.Parameters.id,
                    "categorySort": Category.Parameters.sort,

                    "tagId": Tag.Parameters.id,
                    "tagSort": Tag.Parameters.sort,

                    "petId": Pet.Parameters.id,
                    "petSort": Pet.Parameters.sort,

                    "page": Server.Parameters.page,
                    "size": Server.Parameters.size,
                    "search": Server.Parameters.search,
                    "order": Server.Parameters.order,
                ],
                examples: [:],
                requestBodies: [:],
                headers: [:],
                securitySchemes: [
                    "bearerAuth": .init(
                        type: .http(
                            scheme: "bearer",
                            bearerFormat: "token"
                        ),
                        description: "Authorization header using a Bearer token"
                    )
                ]
            ),
            tags: [
                .init(
                    name: "Categories",
                    description: "Pet categories, such as cat, dog, etc."
                ),
                .init(
                    name: "Tags",
                    description: "Pet tags, such as tabby, brown, etc."
                ),
                .init(
                    name: "Pets",
                    description: "Everything about pets..."
                ),
            ]
        )
    }
}
