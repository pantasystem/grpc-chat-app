///
//  Generated code. Do not modify.
//  source: proto/room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'room.pb.dart' as $1;
import '../google/protobuf/empty.pb.dart' as $2;
export 'room.pb.dart';

class RoomServiceClient extends $grpc.Client {
  static final _$create = $grpc.ClientMethod<$1.CreateRoomRequest, $1.Room>(
      '/RoomService/Create',
      ($1.CreateRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Room.fromBuffer(value));
  static final _$find = $grpc.ClientMethod<$1.FindRoomRequest, $1.Room>(
      '/RoomService/Find',
      ($1.FindRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Room.fromBuffer(value));
  static final _$findRoomMembers =
      $grpc.ClientMethod<$1.FindRoomRequest, $1.FindRoomMembersResponse>(
          '/RoomService/FindRoomMembers',
          ($1.FindRoomRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.FindRoomMembersResponse.fromBuffer(value));
  static final _$joinRoom = $grpc.ClientMethod<$1.JoinRoomRequest, $1.Room>(
      '/RoomService/JoinRoom',
      ($1.JoinRoomRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Room.fromBuffer(value));
  static final _$findJoinedRooms =
      $grpc.ClientMethod<$1.FindJoinedRoomsRequest, $1.FindJoinedRoomsResponse>(
          '/RoomService/FindJoinedRooms',
          ($1.FindJoinedRoomsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.FindJoinedRoomsResponse.fromBuffer(value));
  static final _$findOwnedRooms =
      $grpc.ClientMethod<$2.Empty, $1.FindOwnedRoomsResponse>(
          '/RoomService/FindOwnedRooms',
          ($2.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.FindOwnedRoomsResponse.fromBuffer(value));
  static final _$findAllRooms =
      $grpc.ClientMethod<$2.Empty, $1.FindAllRoomsResponse>(
          '/RoomService/FindAllRooms',
          ($2.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.FindAllRoomsResponse.fromBuffer(value));

  RoomServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.Room> create($1.CreateRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$1.Room> find($1.FindRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$find, request, options: options);
  }

  $grpc.ResponseFuture<$1.FindRoomMembersResponse> findRoomMembers(
      $1.FindRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findRoomMembers, request, options: options);
  }

  $grpc.ResponseFuture<$1.Room> joinRoom($1.JoinRoomRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$joinRoom, request, options: options);
  }

  $grpc.ResponseFuture<$1.FindJoinedRoomsResponse> findJoinedRooms(
      $1.FindJoinedRoomsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findJoinedRooms, request, options: options);
  }

  $grpc.ResponseFuture<$1.FindOwnedRoomsResponse> findOwnedRooms(
      $2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findOwnedRooms, request, options: options);
  }

  $grpc.ResponseFuture<$1.FindAllRoomsResponse> findAllRooms($2.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$findAllRooms, request, options: options);
  }
}

abstract class RoomServiceBase extends $grpc.Service {
  $core.String get $name => 'RoomService';

  RoomServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.CreateRoomRequest, $1.Room>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.CreateRoomRequest.fromBuffer(value),
        ($1.Room value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FindRoomRequest, $1.Room>(
        'Find',
        find_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.FindRoomRequest.fromBuffer(value),
        ($1.Room value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.FindRoomRequest, $1.FindRoomMembersResponse>(
            'FindRoomMembers',
            findRoomMembers_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.FindRoomRequest.fromBuffer(value),
            ($1.FindRoomMembersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.JoinRoomRequest, $1.Room>(
        'JoinRoom',
        joinRoom_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.JoinRoomRequest.fromBuffer(value),
        ($1.Room value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.FindJoinedRoomsRequest,
            $1.FindJoinedRoomsResponse>(
        'FindJoinedRooms',
        findJoinedRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $1.FindJoinedRoomsRequest.fromBuffer(value),
        ($1.FindJoinedRoomsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.FindOwnedRoomsResponse>(
        'FindOwnedRooms',
        findOwnedRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.FindOwnedRoomsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.Empty, $1.FindAllRoomsResponse>(
        'FindAllRooms',
        findAllRooms_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.Empty.fromBuffer(value),
        ($1.FindAllRoomsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.Room> create_Pre($grpc.ServiceCall call,
      $async.Future<$1.CreateRoomRequest> request) async {
    return create(call, await request);
  }

  $async.Future<$1.Room> find_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FindRoomRequest> request) async {
    return find(call, await request);
  }

  $async.Future<$1.FindRoomMembersResponse> findRoomMembers_Pre(
      $grpc.ServiceCall call, $async.Future<$1.FindRoomRequest> request) async {
    return findRoomMembers(call, await request);
  }

  $async.Future<$1.Room> joinRoom_Pre(
      $grpc.ServiceCall call, $async.Future<$1.JoinRoomRequest> request) async {
    return joinRoom(call, await request);
  }

  $async.Future<$1.FindJoinedRoomsResponse> findJoinedRooms_Pre(
      $grpc.ServiceCall call,
      $async.Future<$1.FindJoinedRoomsRequest> request) async {
    return findJoinedRooms(call, await request);
  }

  $async.Future<$1.FindOwnedRoomsResponse> findOwnedRooms_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async {
    return findOwnedRooms(call, await request);
  }

  $async.Future<$1.FindAllRoomsResponse> findAllRooms_Pre(
      $grpc.ServiceCall call, $async.Future<$2.Empty> request) async {
    return findAllRooms(call, await request);
  }

  $async.Future<$1.Room> create(
      $grpc.ServiceCall call, $1.CreateRoomRequest request);
  $async.Future<$1.Room> find(
      $grpc.ServiceCall call, $1.FindRoomRequest request);
  $async.Future<$1.FindRoomMembersResponse> findRoomMembers(
      $grpc.ServiceCall call, $1.FindRoomRequest request);
  $async.Future<$1.Room> joinRoom(
      $grpc.ServiceCall call, $1.JoinRoomRequest request);
  $async.Future<$1.FindJoinedRoomsResponse> findJoinedRooms(
      $grpc.ServiceCall call, $1.FindJoinedRoomsRequest request);
  $async.Future<$1.FindOwnedRoomsResponse> findOwnedRooms(
      $grpc.ServiceCall call, $2.Empty request);
  $async.Future<$1.FindAllRoomsResponse> findAllRooms(
      $grpc.ServiceCall call, $2.Empty request);
}
