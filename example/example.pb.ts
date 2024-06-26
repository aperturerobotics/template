// @generated by protoc-gen-es-lite unknown with parameter "target=ts,ts_nocheck=false"
// @generated from file github.com/aperturerobotics/template/example/example.proto (package example, syntax proto3)
/* eslint-disable */

import type { MessageType, PartialFieldInfo } from '@aptre/protobuf-es-lite'
import { createMessageType, ScalarType } from '@aptre/protobuf-es-lite'

export const protobufPackage = 'example'

/**
 * EchoMsg is the message body for Echo.
 *
 * @generated from message example.EchoMsg
 */
export interface EchoMsg {
  /**
   * @generated from field: string body = 1;
   */
  body?: string
}

// EchoMsg contains the message type declaration for EchoMsg.
export const EchoMsg: MessageType<EchoMsg> = createMessageType({
  typeName: 'example.EchoMsg',
  fields: [
    { no: 1, name: 'body', kind: 'scalar', T: ScalarType.STRING },
  ] as readonly PartialFieldInfo[],
  packedByDefault: true,
})
