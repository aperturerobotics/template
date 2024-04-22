// @generated by protoc-gen-es v1.9.0 with parameter "target=ts,ts_nocheck=false"
// @generated from file github.com/aperturerobotics/template/example/example.proto (package example, syntax proto3)
/* eslint-disable */

import type { BinaryReadOptions, FieldList, JsonReadOptions, JsonValue, PartialMessage, PlainMessage } from "@bufbuild/protobuf";
import { Message, proto3 } from "@bufbuild/protobuf";

/**
 * EchoMsg is the message body for Echo.
 *
 * @generated from message example.EchoMsg
 */
export class EchoMsg extends Message<EchoMsg> {
  /**
   * @generated from field: string body = 1;
   */
  body = "";

  constructor(data?: PartialMessage<EchoMsg>) {
    super();
    proto3.util.initPartial(data, this);
  }

  static readonly runtime: typeof proto3 = proto3;
  static readonly typeName = "example.EchoMsg";
  static readonly fields: FieldList = proto3.util.newFieldList(() => [
    { no: 1, name: "body", kind: "scalar", T: 9 /* ScalarType.STRING */ },
  ]);

  static fromBinary(bytes: Uint8Array, options?: Partial<BinaryReadOptions>): EchoMsg {
    return new EchoMsg().fromBinary(bytes, options);
  }

  static fromJson(jsonValue: JsonValue, options?: Partial<JsonReadOptions>): EchoMsg {
    return new EchoMsg().fromJson(jsonValue, options);
  }

  static fromJsonString(jsonString: string, options?: Partial<JsonReadOptions>): EchoMsg {
    return new EchoMsg().fromJsonString(jsonString, options);
  }

  static equals(a: EchoMsg | PlainMessage<EchoMsg> | undefined, b: EchoMsg | PlainMessage<EchoMsg> | undefined): boolean {
    return proto3.util.equals(EchoMsg, a, b);
  }
}

