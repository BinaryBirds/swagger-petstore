import Foundation
import OpenAPIKit30

extension Server {

    enum Security {

        static let bearerAuth: [OpenAPI.SecurityRequirement] = [
            [
                .component(named: "bearerAuth"): []
            ]
        ]
    }
}
