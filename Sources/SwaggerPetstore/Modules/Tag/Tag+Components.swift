import Foundation
import OpenAPIKit30

extension Tag {

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
                ]
            )
        }

        static var detail: JSONSchema {
            .object(
                properties: [
                    "id": Server.Fields.uuid(),
                    "name": Fields.name(),
                ]
            )
        }

        static var create: JSONSchema {
            .object(
                properties: [
                    "name": Fields.name()
                ]
            )
        }

        static var update: JSONSchema {
            .object(
                properties: [
                    "name": Fields.name()
                ]
            )
        }

        static var patch: JSONSchema {
            .object(
                properties: [
                    "name": Fields.name(required: false)
                ]
            )
        }
    }

}
