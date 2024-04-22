// Code generated by protoc-gen-go-lite. DO NOT EDIT.
// protoc-gen-go-lite version: v0.4.1
// source: github.com/aperturerobotics/template/example/example.proto

package example

import (
	io "io"

	protobuf_go_lite "github.com/aperturerobotics/protobuf-go-lite"
	json "github.com/aperturerobotics/protobuf-go-lite/json"
	errors "github.com/pkg/errors"
)

// EchoMsg is the message body for Echo.
type EchoMsg struct {
	unknownFields []byte
	Body          string `protobuf:"bytes,1,opt,name=body,proto3" json:"body,omitempty"`
}

func (x *EchoMsg) Reset() {
	*x = EchoMsg{}
}

func (*EchoMsg) ProtoMessage() {}

func (x *EchoMsg) GetBody() string {
	if x != nil {
		return x.Body
	}
	return ""
}

func (m *EchoMsg) CloneVT() *EchoMsg {
	if m == nil {
		return (*EchoMsg)(nil)
	}
	r := new(EchoMsg)
	r.Body = m.Body
	if len(m.unknownFields) > 0 {
		r.unknownFields = make([]byte, len(m.unknownFields))
		copy(r.unknownFields, m.unknownFields)
	}
	return r
}

func (m *EchoMsg) CloneMessageVT() any {
	return m.CloneVT()
}

func (this *EchoMsg) EqualVT(that *EchoMsg) bool {
	if this == that {
		return true
	} else if this == nil || that == nil {
		return false
	}
	if this.Body != that.Body {
		return false
	}
	return string(this.unknownFields) == string(that.unknownFields)
}

func (this *EchoMsg) EqualMessageVT(thatMsg any) bool {
	that, ok := thatMsg.(*EchoMsg)
	if !ok {
		return false
	}
	return this.EqualVT(that)
}

// MarshalProtoJSON marshals the EchoMsg message to JSON.
func (x *EchoMsg) MarshalProtoJSON(s *json.MarshalState) {
	if x == nil {
		s.WriteNil()
		return
	}
	s.WriteObjectStart()
	var wroteField bool
	if x.Body != "" || s.HasField("body") {
		s.WriteMoreIf(&wroteField)
		s.WriteObjectField("body")
		s.WriteString(x.Body)
	}
	s.WriteObjectEnd()
}

// MarshalJSON marshals the EchoMsg to JSON.
func (x *EchoMsg) MarshalJSON() ([]byte, error) {
	return json.DefaultMarshalerConfig.Marshal(x)
}

// UnmarshalProtoJSON unmarshals the EchoMsg message from JSON.
func (x *EchoMsg) UnmarshalProtoJSON(s *json.UnmarshalState) {
	if s.ReadNil() {
		return
	}
	s.ReadObject(func(key string) {
		switch key {
		default:
			s.ReadAny() // ignore unknown field
		case "body":
			s.AddField("body")
			x.Body = s.ReadString()
		}
	})
}

// UnmarshalJSON unmarshals the EchoMsg from JSON.
func (x *EchoMsg) UnmarshalJSON(b []byte) error {
	return json.DefaultUnmarshalerConfig.Unmarshal(b, x)
}

func (m *EchoMsg) MarshalVT() (dAtA []byte, err error) {
	if m == nil {
		return nil, nil
	}
	size := m.SizeVT()
	dAtA = make([]byte, size)
	n, err := m.MarshalToSizedBufferVT(dAtA[:size])
	if err != nil {
		return nil, err
	}
	return dAtA[:n], nil
}

func (m *EchoMsg) MarshalToVT(dAtA []byte) (int, error) {
	size := m.SizeVT()
	return m.MarshalToSizedBufferVT(dAtA[:size])
}

func (m *EchoMsg) MarshalToSizedBufferVT(dAtA []byte) (int, error) {
	if m == nil {
		return 0, nil
	}
	i := len(dAtA)
	_ = i
	var l int
	_ = l
	if m.unknownFields != nil {
		i -= len(m.unknownFields)
		copy(dAtA[i:], m.unknownFields)
	}
	if len(m.Body) > 0 {
		i -= len(m.Body)
		copy(dAtA[i:], m.Body)
		i = protobuf_go_lite.EncodeVarint(dAtA, i, uint64(len(m.Body)))
		i--
		dAtA[i] = 0xa
	}
	return len(dAtA) - i, nil
}

func (m *EchoMsg) SizeVT() (n int) {
	if m == nil {
		return 0
	}
	var l int
	_ = l
	l = len(m.Body)
	if l > 0 {
		n += 1 + l + protobuf_go_lite.SizeOfVarint(uint64(l))
	}
	n += len(m.unknownFields)
	return n
}

func (m *EchoMsg) UnmarshalVT(dAtA []byte) error {
	l := len(dAtA)
	iNdEx := 0
	for iNdEx < l {
		preIndex := iNdEx
		var wire uint64
		for shift := uint(0); ; shift += 7 {
			if shift >= 64 {
				return protobuf_go_lite.ErrIntOverflow
			}
			if iNdEx >= l {
				return io.ErrUnexpectedEOF
			}
			b := dAtA[iNdEx]
			iNdEx++
			wire |= uint64(b&0x7F) << shift
			if b < 0x80 {
				break
			}
		}
		fieldNum := int32(wire >> 3)
		wireType := int(wire & 0x7)
		if wireType == 4 {
			return errors.Errorf("proto: EchoMsg: wiretype end group for non-group")
		}
		if fieldNum <= 0 {
			return errors.Errorf("proto: EchoMsg: illegal tag %d (wire type %d)", fieldNum, wire)
		}
		switch fieldNum {
		case 1:
			if wireType != 2 {
				return errors.Errorf("proto: wrong wireType = %d for field Body", wireType)
			}
			var stringLen uint64
			for shift := uint(0); ; shift += 7 {
				if shift >= 64 {
					return protobuf_go_lite.ErrIntOverflow
				}
				if iNdEx >= l {
					return io.ErrUnexpectedEOF
				}
				b := dAtA[iNdEx]
				iNdEx++
				stringLen |= uint64(b&0x7F) << shift
				if b < 0x80 {
					break
				}
			}
			intStringLen := int(stringLen)
			if intStringLen < 0 {
				return protobuf_go_lite.ErrInvalidLength
			}
			postIndex := iNdEx + intStringLen
			if postIndex < 0 {
				return protobuf_go_lite.ErrInvalidLength
			}
			if postIndex > l {
				return io.ErrUnexpectedEOF
			}
			m.Body = string(dAtA[iNdEx:postIndex])
			iNdEx = postIndex
		default:
			iNdEx = preIndex
			skippy, err := protobuf_go_lite.Skip(dAtA[iNdEx:])
			if err != nil {
				return err
			}
			if (skippy < 0) || (iNdEx+skippy) < 0 {
				return protobuf_go_lite.ErrInvalidLength
			}
			if (iNdEx + skippy) > l {
				return io.ErrUnexpectedEOF
			}
			m.unknownFields = append(m.unknownFields, dAtA[iNdEx:iNdEx+skippy]...)
			iNdEx += skippy
		}
	}

	if iNdEx > l {
		return io.ErrUnexpectedEOF
	}
	return nil
}
