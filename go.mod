module github.com/aperturerobotics/template

go 1.24

toolchain go1.24.2

replace (
	// This fork uses go-protobuf-lite and adds post-quantum crypto support.
	github.com/libp2p/go-libp2p => github.com/aperturerobotics/go-libp2p v0.37.1-0.20241111002741-5cfbb50b74e0 // aperture

	// This fork uses go-protobuf-lite.
	github.com/libp2p/go-msgio => github.com/aperturerobotics/go-libp2p-msgio v0.0.0-20240511033615-1b69178aa5c8 // aperture
)

require (
	github.com/aperturerobotics/common v0.22.1 // latest
	github.com/aperturerobotics/protobuf-go-lite v0.9.1 // latest
	github.com/aperturerobotics/starpc v0.38.1 // latest
)

require (
	github.com/aperturerobotics/json-iterator-lite v1.0.1-0.20241223092408-d525fa878b3e // indirect
	github.com/aperturerobotics/util v1.29.2 // indirect
	github.com/coder/websocket v1.8.13 // indirect
	github.com/ipfs/go-cid v0.5.0 // indirect
	github.com/klauspost/cpuid/v2 v2.2.10 // indirect
	github.com/libp2p/go-buffer-pool v0.1.0 // indirect
	github.com/libp2p/go-libp2p v0.41.1 // indirect
	github.com/libp2p/go-yamux/v4 v4.0.1 // indirect
	github.com/minio/sha256-simd v1.0.1 // indirect
	github.com/mr-tron/base58 v1.2.0 // indirect
	github.com/multiformats/go-base32 v0.1.0 // indirect
	github.com/multiformats/go-base36 v0.2.0 // indirect
	github.com/multiformats/go-multiaddr v0.13.0 // indirect
	github.com/multiformats/go-multibase v0.2.0 // indirect
	github.com/multiformats/go-multihash v0.2.3 // indirect
	github.com/multiformats/go-multistream v0.6.0 // indirect
	github.com/multiformats/go-varint v0.0.7 // indirect
	github.com/pkg/errors v0.9.1 // indirect
	github.com/sirupsen/logrus v1.9.3 // indirect
	github.com/spaolacci/murmur3 v1.1.0 // indirect
	golang.org/x/crypto v0.35.0 // indirect
	golang.org/x/exp v0.0.0-20250305212735-054e65f0b394 // indirect
	golang.org/x/sys v0.30.0 // indirect
	lukechampine.com/blake3 v1.4.0 // indirect
)
