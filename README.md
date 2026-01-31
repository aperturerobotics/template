## Project Template

[![GoDoc Widget]][GoDoc] [![Go Report Card Widget]][Go Report Card]

[GoDoc]: https://godoc.org/github.com/aperturerobotics/template
[GoDoc Widget]: https://godoc.org/github.com/aperturerobotics/template?status.svg
[Go Report Card Widget]: https://goreportcard.com/badge/github.com/aperturerobotics/template
[Go Report Card]: https://goreportcard.com/report/github.com/aperturerobotics/template

This is a template for Aperture Robotics projects.

See [protobuf-project] for a more extensive example.

[protobuf-project]: https://github.com/aperturerobotics/protobuf-project

## Usage

Start by downloading the dependencies:

```bash
bun install
```

Protobuf imports use Go paths and package names:

```protobuf
syntax = "proto3";
package example;

// Import .proto files using Go-style import paths.
import "github.com/aperturerobotics/controllerbus/controller/controller.proto";

// GetBusInfoResponse is the response type for GetBusInfo.
message GetBusInfoResponse {
  // RunningControllers is the list of running controllers.
  repeated controller.Info running_controllers = 1;
}
```

To generate the protobuf files:

```bash
git add -A
bun install
bun run gen
```

## Commands

The `aptre` CLI replaces Make for building Go projects with protobuf support.

Available bun scripts:

| Command             | Description                                  |
| ------------------- | -------------------------------------------- |
| `bun run gen`       | Generate protobuf code (Go, TypeScript, C++) |
| `bun run gen:force` | Force regenerate all protobuf files          |
| `bun run test`      | Run all tests (Go + JS)                      |
| `bun run lint`      | Run linters (Go + JS)                        |
| `bun run lint:go`   | Run golangci-lint                            |
| `bun run lint:js`   | Run ESLint on TypeScript                     |
| `bun run format`    | Format all code (Go + JS)                    |
| `bun run build`     | Build TypeScript and Vite                    |

The `aptre` CLI can also be used directly:

```bash
# Generate protobuf files
go run github.com/aperturerobotics/common/cmd/aptre generate

# Force regeneration
go run github.com/aperturerobotics/common/cmd/aptre generate --force

# Run tests
go run github.com/aperturerobotics/common/cmd/aptre test

# Lint code
go run github.com/aperturerobotics/common/cmd/aptre lint

# Format code
go run github.com/aperturerobotics/common/cmd/aptre format
```

## C++ Support

C++ protobuf files (`.pb.cc` and `.pb.h`) are generated alongside Go and TypeScript
files. See [common] for CMake integration instructions.

[common]: https://github.com/aperturerobotics/common

## Support

Please open a [GitHub issue] with any questions / issues.

[GitHub issue]: https://github.com/aperturerobotics/protobuf-project/issues/new

... or feel free to reach out on [Matrix Chat] or [Discord].

[Discord]: https://discord.gg/KJutMESRsT
[Matrix Chat]: https://matrix.to/#/#aperturerobotics:matrix.org

## License

MIT
