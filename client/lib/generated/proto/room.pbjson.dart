///
//  Generated code. Do not modify.
//  source: proto/room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use roomDescriptor instead')
const Room$json = const {
  '1': 'Room',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'owner_id', '3': 3, '4': 1, '5': 9, '10': 'ownerId'},
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode('CgRSb29tEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhkKCG93bmVyX2lkGAMgASgJUgdvd25lcklk');
@$core.Deprecated('Use createRoomRequestDescriptor instead')
const CreateRoomRequest$json = const {
  '1': 'CreateRoomRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `CreateRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVSb29tUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1l');
@$core.Deprecated('Use findRoomRequestDescriptor instead')
const FindRoomRequest$json = const {
  '1': 'FindRoomRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `FindRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findRoomRequestDescriptor = $convert.base64Decode('Cg9GaW5kUm9vbVJlcXVlc3QSDgoCaWQYASABKAlSAmlk');
@$core.Deprecated('Use findRoomMembersResponseDescriptor instead')
const FindRoomMembersResponse$json = const {
  '1': 'FindRoomMembersResponse',
  '2': const [
    const {'1': 'account', '3': 1, '4': 3, '5': 11, '6': '.Account', '10': 'account'},
  ],
};

/// Descriptor for `FindRoomMembersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findRoomMembersResponseDescriptor = $convert.base64Decode('ChdGaW5kUm9vbU1lbWJlcnNSZXNwb25zZRIiCgdhY2NvdW50GAEgAygLMgguQWNjb3VudFIHYWNjb3VudA==');
@$core.Deprecated('Use joinRoomRequestDescriptor instead')
const JoinRoomRequest$json = const {
  '1': 'JoinRoomRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `JoinRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinRoomRequestDescriptor = $convert.base64Decode('Cg9Kb2luUm9vbVJlcXVlc3QSDgoCaWQYASABKAlSAmlk');
