# https://github.com/aperturerobotics/template

SHELL:=bash
PROTOWRAP=hack/bin/protowrap
PROTOC_GEN_GO=hack/bin/protoc-gen-go-lite
PROTOC_GEN_STARPC=hack/bin/protoc-gen-go-starpc
GOIMPORTS=hack/bin/goimports
GOFUMPT=hack/bin/gofumpt
GOLANGCI_LINT=hack/bin/golangci-lint
GO_MOD_OUTDATED=hack/bin/go-mod-outdated
GOLIST=go list -f "{{ .Dir }}" -m

export GO111MODULE=on
undefine GOOS
undefine GOARCH

all:

vendor:
	go mod vendor

$(PROTOC_GEN_GO):
	cd ./hack; \
	go build -v \
		-o ./bin/protoc-gen-go-lite \
		github.com/aperturerobotics/protobuf-go-lite/cmd/protoc-gen-go-lite

$(PROTOC_GEN_STARPC):
	cd ./hack; \
	go build -v \
		-o ./bin/protoc-gen-go-starpc \
		github.com/aperturerobotics/starpc/cmd/protoc-gen-go-starpc

$(GOIMPORTS):
	cd ./hack; \
	go build -v \
		-o ./bin/goimports \
		golang.org/x/tools/cmd/goimports

$(GOFUMPT):
	cd ./hack; \
	go build -v \
		-o ./bin/gofumpt \
		mvdan.cc/gofumpt

$(PROTOWRAP):
	cd ./hack; \
	go build -v \
		-o ./bin/protowrap \
		github.com/aperturerobotics/goprotowrap/cmd/protowrap

$(GOLANGCI_LINT):
	cd ./hack; \
	go build -v \
		-o ./bin/golangci-lint \
		github.com/golangci/golangci-lint/cmd/golangci-lint

$(GO_MOD_OUTDATED):
	cd ./hack; \
	go build -v \
		-o ./bin/go-mod-outdated \
		github.com/psampaz/go-mod-outdated

.PHONY: genproto
genproto: vendor node_modules $(GOIMPORTS) $(PROTOWRAP) $(PROTOC_GEN_GO) $(PROTOC_GEN_STARPC)
	shopt -s globstar; \
	set -eo pipefail; \
	export PROJECT=$$(go list -m); \
	export PATH=$$(pwd)/hack/bin:$${PATH}; \
	mkdir -p $$(pwd)/vendor/$$(dirname $${PROJECT}); \
	rm $$(pwd)/vendor/$${PROJECT} || true; \
	ln -s $$(pwd) $$(pwd)/vendor/$${PROJECT} ; \
	protogen() { \
		$(PROTOWRAP) \
			-I $$(pwd)/vendor \
			--plugin=./node_modules/.bin/protoc-gen-ts_proto \
			--go-lite_out=$$(pwd)/vendor \
			--go-lite_opt=features=marshal+unmarshal+size+equal+clone+json+unmarshal_unsafe \
			--go-starpc_out=$$(pwd)/vendor \
			--ts_proto_out=$$(pwd)/vendor \
			--ts_proto_opt=esModuleInterop=true \
			--ts_proto_opt=fileSuffix=.pb \
			--ts_proto_opt=importSuffix=.js \
			--ts_proto_opt=forceLong=long \
			--ts_proto_opt=oneof=unions \
			--ts_proto_opt=outputServices=default,outputServices=generic-definitions \
			--ts_proto_opt=useAbortSignal=true \
			--ts_proto_opt=useAsyncIterable=true \
			--ts_proto_opt=useDate=true \
			--proto_path $$(pwd)/vendor \
			--print_structure \
			--only_specified_files \
			$$(\
				git \
					ls-files "$$1" |\
					xargs printf -- \
					"$$(pwd)/vendor/$${PROJECT}/%s "); \
	}; \
	protogen "./*.proto"; \
	rm $$(pwd)/vendor/$${PROJECT} || true
	$(GOIMPORTS) -w ./
	npm run format:js

node_modules:
	yarn install

.PHONY: gen
gen: genproto

.PHONY: outdated
outdated: $(GO_MOD_OUTDATED)
	go list -mod=mod -u -m -json all | $(GO_MOD_OUTDATED) -update -direct

.PHONY: list
list: $(GO_MOD_OUTDATED)
	go list -mod=mod -u -m -json all | $(GO_MOD_OUTDATED)

.PHONY: lint
lint: $(GOLANGCI_LINT)
	$(GOLANGCI_LINT) run --timeout=10m

.PHONY: fix
fix: $(GOLANGCI_LINT)
	$(GOLANGCI_LINT) run --fix --timeout=10m

.PHONY: format
format: $(GOFUMPT) $(GOIMPORTS)
	$(GOIMPORTS) -w ./
	$(GOFUMPT) -w ./

.PHONY: test
test:
	go test -v ./...
