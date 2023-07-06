generate:
	swift run SwaggerPetstore

#
# Please install swift server first:
#
# https://github.com/binarybirds/swift-server
#
preview: generate
	swift server ./dist --port 3000

#
# Please install swagger-cli first:
#
# https://github.com/APIDevTools/swagger-cli
#
lint: lint-yaml lint-json

lint-yaml:
	swagger-cli validate ./dist/swagger.yaml

lint-json:
	swagger-cli validate ./dist/swagger.json
