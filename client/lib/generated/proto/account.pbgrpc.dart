///
//  Generated code. Do not modify.
//  source: proto/account.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'account.pb.dart' as $0;
import '../google/protobuf/empty.pb.dart' as $1;
export 'account.pb.dart';

class AccountServiceClient extends $grpc.Client {
  static final _$createAccount =
      $grpc.ClientMethod<$0.CreateAccountRequest, $0.CreateAccountResponse>(
          '/AccountService/CreateAccount',
          ($0.CreateAccountRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CreateAccountResponse.fromBuffer(value));
  static final _$find = $grpc.ClientMethod<$0.FindUser, $0.Account>(
      '/AccountService/Find',
      ($0.FindUser value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Account.fromBuffer(value));
  static final _$findMe = $grpc.ClientMethod<$1.Empty, $0.FindMeResponse>(
      '/AccountService/FindMe',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FindMeResponse.fromBuffer(value));

  AccountServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateAccountResponse> createAccount(
      $0.CreateAccountRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.Account> find($0.FindUser request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$find, request, options: options);
  }

  $grpc.ResponseFuture<$0.FindMeResponse> findMe($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findMe, request, options: options);
  }
}

abstract class AccountServiceBase extends $grpc.Service {
  $core.String get $name => 'AccountService';

  AccountServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CreateAccountRequest, $0.CreateAccountResponse>(
            'CreateAccount',
            createAccount_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreateAccountRequest.fromBuffer(value),
            ($0.CreateAccountResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FindUser, $0.Account>(
        'Find',
        find_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FindUser.fromBuffer(value),
        ($0.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.FindMeResponse>(
        'FindMe',
        findMe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.FindMeResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateAccountResponse> createAccount_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CreateAccountRequest> request) async {
    return createAccount(call, await request);
  }

  $async.Future<$0.Account> find_Pre(
      $grpc.ServiceCall call, $async.Future<$0.FindUser> request) async {
    return find(call, await request);
  }

  $async.Future<$0.FindMeResponse> findMe_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return findMe(call, await request);
  }

  $async.Future<$0.CreateAccountResponse> createAccount(
      $grpc.ServiceCall call, $0.CreateAccountRequest request);
  $async.Future<$0.Account> find($grpc.ServiceCall call, $0.FindUser request);
  $async.Future<$0.FindMeResponse> findMe(
      $grpc.ServiceCall call, $1.Empty request);
}
