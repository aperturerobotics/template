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
yarn
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
$ git add -A
$ yarn install
$ yarn gen
```

The Makefile will download the tools using Go to a bin dir.

## Makefile

The available make targets are:

 - `gengo`: Generate protobuf files.
 - `test`: run go test -v ./...
 - `lint`: run golangci-lint on the project.
 - `fix`: run golangci-lint --fix on the project.
 - `list`: list go module dependencies
 - `outdated`: list outdated go module dependencies

To generate the TypeScript and Go code:

 - `yarn install`
 - `yarn gen`

## Developing on MacOS

On MacOS, some homebrew packages are required for `yarn gen`:

```
brew install bash make coreutils gnu-sed findutils protobuf
brew link --overwrite protobuf
```

Add to your .bashrc or .zshrc:

```
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
```

## Support

Please open a [GitHub issue] with any questions / issues.

[GitHub issue]: https://github.com/aperturerobotics/protobuf-project/issues/new

... or feel free to reach out on [Matrix Chat] or [Discord].

[Discord]: https://discord.gg/KJutMESRsT
[Matrix Chat]: https://matrix.to/#/#aperturerobotics:matrix.org

## License

MIT
