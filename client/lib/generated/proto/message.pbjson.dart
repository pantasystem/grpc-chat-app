///
//  Generated code. Do not modify.
//  source: proto/message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
    const {
      '1': 'author',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.Account',
      '10': 'author'
    },
    const {
      '1': 'timestamp',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEg4KAmlkGAEgASgJUgJpZBISCgR0ZXh0GAIgASgJUgR0ZXh0EiAKBmF1dGhvchgDIAEoCzIILkFjY291bnRSBmF1dGhvchI4Cgl0aW1lc3RhbXAYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXA=');
@$core.Deprecated('Use createMessageRequestDescriptor instead')
const CreateMessageRequest$json = const {
  '1': 'CreateMessageRequest',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
    const {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `CreateMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMessageRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVNZXNzYWdlUmVxdWVzdBIXCgdyb29tX2lkGAEgASgJUgZyb29tSWQSEgoEdGV4dBgCIAEoCVIEdGV4dA==');
@$core.Deprecated('Use observeMessageRequestDescriptor instead')
const ObserveMessageRequest$json = const {
  '1': 'ObserveMessageRequest',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `ObserveMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List observeMessageRequestDescriptor =
    $convert.base64Decode(
        'ChVPYnNlcnZlTWVzc2FnZVJlcXVlc3QSFwoHcm9vbV9pZBgBIAEoCVIGcm9vbUlk');
@$core.Deprecated('Use findAllMessagesRequestDescriptor instead')
const FindAllMessagesRequest$json = const {
  '1': 'FindAllMessagesRequest',
  '2': const [
    const {'1': 'room_id', '3': 1, '4': 1, '5': 9, '10': 'roomId'},
  ],
};

/// Descriptor for `FindAllMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findAllMessagesRequestDescriptor =
    $convert.base64Decode(
        'ChZGaW5kQWxsTWVzc2FnZXNSZXF1ZXN0EhcKB3Jvb21faWQYASABKAlSBnJvb21JZA==');
@$core.Deprecated('Use messagesResponseDescriptor instead')
const MessagesResponse$json = const {
  '1': 'MessagesResponse',
  '2': const [
    const {
      '1': 'messages',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.Message',
      '10': 'messages'
    },
  ],
};

/// Descriptor for `MessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messagesResponseDescriptor = $convert.base64Decode(
    'ChBNZXNzYWdlc1Jlc3BvbnNlEiQKCG1lc3NhZ2VzGAEgAygLMgguTWVzc2FnZVIIbWVzc2FnZXM=');
