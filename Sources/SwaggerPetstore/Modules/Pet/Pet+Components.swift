import Foundation
import OpenAPIKit30

extension Pet {

    enum Components {

        static var reference: JSONSchema {
            .object(
                properties: [
                    "id": Server.Fields.uuid(),
                    "name": Fields.name(),
                ]
            )
        }

        static var list: JSONSchema {
            .object(
                properties: [
                    "id": Server.Fields.uuid(),
                    "name": Fields.name(),
                    "imageUrl": Server.Fields.url(),
                    "status": Fields.status(required: false),
                ]
            )
        }

        static var detail: JSONSchema {
            .object(
                properties: [
                    "id": Server.Fields.uuid(),
                    "name": Fields.name(),
                    "status": Fields.status(required: false),
                    "imageUrl": Server.Fields.url(),
                    "category": .ref("CategoryReference"),
                    "tags": .array(items: .ref("TagReference")),
                ]
            )
        }

        static var create: JSONSchema {
            .object(
                properties: [
                    "name": Fields.name(),
                    "status": Fields.status(required: false),
                    "imageUrl": Server.Fields.url(),
                    "categoryIds": .array(
                        items: Server.Fields.uuid()
                    ),
                    "tagId": Server.Fields.uuid(),
                ]
            )
        }

        static var update: JSONSchema {
            .object(
                properties: [
                    "name": Fields.name(),
                    "status": Fields.status(required: false),
                    "imageUrl": Server.Fields.url(),
                    "categoryIds": .array(
                        items: Server.Fields.uuid()
                    ),
                    "tagId": Server.Fields.uuid(),
                ]
            )
        }

        static var patch: JSONSchema {
            .object(
                properties: [
                    "name": Fields.name(required: false),
                    "status": Fields.status(required: false),
                    "imageUrl": Server.Fields.url(required: false),
                    "categoryIds": .array(
                        required: false,
                        items: Server.Fields.uuid()
                    ),
                    "tagId": Server.Fields.uuid(required: false),
                ]
            )
        }
    }

}
