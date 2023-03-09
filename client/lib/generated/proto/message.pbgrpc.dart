///
//  Generated code. Do not modify.
//  source: proto/message.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'message.pb.dart' as $1;
export 'message.pb.dart';

class MessageServiceClient extends $grpc.Client {
  static final _$createMessage =
      $grpc.ClientMethod<$1.CreateMessageRequest, $1.Message>(
          '/MessageService/CreateMessage',
          ($1.CreateMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Message.fromBuffer(value));
  static final _$observeMessages =
      $grpc.ClientMethod<$1.ObserveMessageRequest, $1.Message>(
          '/MessageService/ObserveMessages',
          ($1.ObserveMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $1.Message.fromBuffer(value));
  static final _$findAllMessages =
      $grpc.ClientMethod<$1.FindAllMessagesRequest, $1.MessagesResponse>(
          '/MessageService/FindAllMessages',
          ($1.FindAllMessagesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.MessagesResponse.fromBuffer(value));

  MessageServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Message> createMessage(
      $1.CreateMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMessage, request, options: options);
  }

  $grpc.ResponseStream<$1.Message> observeMessages(
      $1.ObserveMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$observeMessages, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$1.MessagesResponse> findAllMessages(
      $1.FindAllMessagesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findAllMessages, request, options: options);
  }
}

abstract class MessageServiceBase extends $grpc.Service {
  $core.String get $name => 'MessageService';

  MessageServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.CreateMessageRequest, $1.Message>(
        'CreateMessage',
        createMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.CreateMessageRequest.fromBuffer(value),
        ($1.Message value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.ObserveMessageRequest, $1.Message>(
        'ObserveMessages',
        observeMessages_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $1.ObserveMessageRequest.fromBuffer(value),
        ($1.Message value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.FindAllMessagesRequest, $1.MessagesResponse>(
            'FindAllMessages',
            findAllMessages_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.FindAllMessagesRequest.fromBuffer(value),
            ($1.MessagesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.Message> createMessage_Pre($grpc.ServiceCall call,
      $async.Future<$1.CreateMessageRequest> request) async {
    return createMessage(call, await request);
  }

  $async.Stream<$1.Message> observeMessages_Pre($grpc.ServiceCall call,
      $async.Future<$1.ObserveMessageRequest> request) async* {
    yield* observeMessages(call, await request);
  }

  $async.Future<$1.MessagesResponse> findAllMessages_Pre($grpc.ServiceCall call,
      $async.Future<$1.FindAllMessagesRequest> request) async {
    return findAllMessages(call, await request);
  }

  $async.Future<$1.Message> createMessage(
      $grpc.ServiceCall call, $1.CreateMessageRequest request);
  $async.Stream<$1.Message> observeMessages(
      $grpc.ServiceCall call, $1.ObserveMessageRequest request);
  $async.Future<$1.MessagesResponse> findAllMessages(
      $grpc.ServiceCall call, $1.FindAllMessagesRequest request);
}
