///
//  Generated code. Do not modify.
//  source: proto/account.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AuthState extends $pb.ProtobufEnum {
  static const AuthState UNAUTHENTICATED = AuthState._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNAUTHENTICATED');
  static const AuthState AUTHENTICATED = AuthState._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'AUTHENTICATED');

  static const $core.List<AuthState> values = <AuthState> [
    UNAUTHENTICATED,
    AUTHENTICATED,
  ];

  static final $core.Map<$core.int, AuthState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AuthState? valueOf($core.int value) => _byValue[value];

  const AuthState._($core.int v, $core.String n) : super(v, n);
}

