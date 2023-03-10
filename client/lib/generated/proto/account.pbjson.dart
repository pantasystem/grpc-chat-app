///
//  Generated code. Do not modify.
//  source: proto/account.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use authStateDescriptor instead')
const AuthState$json = const {
  '1': 'AuthState',
  '2': const [
    const {'1': 'UNAUTHENTICATED', '2': 0},
    const {'1': 'AUTHENTICATED', '2': 1},
  ],
};

/// Descriptor for `AuthState`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List authStateDescriptor = $convert.base64Decode('CglBdXRoU3RhdGUSEwoPVU5BVVRIRU5USUNBVEVEEAASEQoNQVVUSEVOVElDQVRFRBAB');
@$core.Deprecated('Use accountDescriptor instead')
const Account$json = const {
  '1': 'Account',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'avatar_url', '3': 3, '4': 1, '5': 9, '10': 'avatarUrl'},
  ],
};

/// Descriptor for `Account`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountDescriptor = $convert.base64Decode('CgdBY2NvdW50Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEh0KCmF2YXRhcl91cmwYAyABKAlSCWF2YXRhclVybA==');
@$core.Deprecated('Use createAccountRequestDescriptor instead')
const CreateAccountRequest$json = const {
  '1': 'CreateAccountRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'avatar_url', '3': 3, '4': 1, '5': 9, '10': 'avatarUrl'},
  ],
};

/// Descriptor for `CreateAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountRequestDescriptor = $convert.base64Decode('ChRDcmVhdGVBY2NvdW50UmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEh0KCmF2YXRhcl91cmwYAyABKAlSCWF2YXRhclVybA==');
@$core.Deprecated('Use createAccountResponseDescriptor instead')
const CreateAccountResponse$json = const {
  '1': 'CreateAccountResponse',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'account', '3': 2, '4': 1, '5': 11, '6': '.Account', '10': 'account'},
  ],
};

/// Descriptor for `CreateAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountResponseDescriptor = $convert.base64Decode('ChVDcmVhdGVBY2NvdW50UmVzcG9uc2USFAoFdG9rZW4YASABKAlSBXRva2VuEiIKB2FjY291bnQYAiABKAsyCC5BY2NvdW50UgdhY2NvdW50');
@$core.Deprecated('Use findUserDescriptor instead')
const FindUser$json = const {
  '1': 'FindUser',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `FindUser`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findUserDescriptor = $convert.base64Decode('CghGaW5kVXNlchIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use findMeResponseDescriptor instead')
const FindMeResponse$json = const {
  '1': 'FindMeResponse',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.Account', '9': 0, '10': 'account', '17': true},
    const {'1': 'auth_state', '3': 2, '4': 1, '5': 14, '6': '.AuthState', '10': 'authState'},
  ],
  '8': const [
    const {'1': '_account'},
  ],
};

/// Descriptor for `FindMeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findMeResponseDescriptor = $convert.base64Decode('Cg5GaW5kTWVSZXNwb25zZRInCgdhY2NvdW50GAEgASgLMgguQWNjb3VudEgAUgdhY2NvdW50iAEBEikKCmF1dGhfc3RhdGUYAiABKA4yCi5BdXRoU3RhdGVSCWF1dGhTdGF0ZUIKCghfYWNjb3VudA==');
