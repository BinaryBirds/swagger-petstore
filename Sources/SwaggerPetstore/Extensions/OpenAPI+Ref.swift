import Foundation
import OpenAPIKit30
import OpenAPIKitCore

extension OpenAPI.Content {

    static func ref(_ name: String) -> Self {
        .init(schemaReference: .internal(.component(name: name)))
    }
}

extension JSONSchema {

    static func ref(_ name: String) -> JSONSchema {
        .reference(.component(named: name))
    }
}

extension Either<JSONReference<OpenAPI.Parameter>, OpenAPI.Parameter> {

    static func ref(_ name: String) -> Self {
        Self.reference(.component(named: name))
    }
}

extension Either<JSONReference<OpenAPI.Response>, OpenAPI.Response> {

    static func ref(_ name: String) -> Self {
        Self.reference(.component(named: name))
    }
}

//
// NOTE: no need for this for now, see Server+Security.swift
//
//extension JSONReference<OpenAPI.SecurityScheme> {
//
//    static func ref(_ name: String) -> Self {
//        Self.component(named: name)
//    }
//}
