
import 'package:client/generated/google/protobuf/empty.pb.dart';
import 'package:client/generated/proto/account.pb.dart';
import 'package:client/generated/proto/room.pbgrpc.dart';
import 'package:client/repositories/AuthRepository.dart';
import 'package:grpc/grpc.dart';

class RoomRepository {
  final AuthRepository authRepository;
  final RoomServiceClient client;
  RoomRepository({required this.authRepository, required this.client});

  Future<Room> create({required String name}) async {
    return await client.create(
        CreateRoomRequest(
          name: name
      ),
      options: CallOptions(
        metadata: {
          "Authorization": "Bearer ${await authRepository.getToken()}"
        }
      )
    );
  }

  Future<List<Room>> findAll() async {
    final res = await client.findAllRooms(Empty(), options: CallOptions(
      metadata: {
        "Authorization": "Bearer ${await authRepository.getToken()}"
      }
    ));
    return res.room;
  }

  Future<List<Room>> findJoined({required String accountId}) async {
    final res = await client.findJoinedRooms(FindJoinedRoomsRequest(
      accountId: accountId,
    ), options: CallOptions(metadata: {
      "Authorization": "Bearer ${await authRepository.getToken()}"
    }));
    return res.room;
  }

  Future<Room> join({required String roomId}) async {
    final res = await client.joinRoom(JoinRoomRequest(id: roomId), options: CallOptions(
      metadata: {
        "Authorization": "Bearer ${await authRepository.getToken()}"
      }
    ));
    return res;
  }

  Future<List<Account>> findJoinedMembers({required String roomId}) async {
    final res = await client.findRoomMembers(FindRoomRequest(id: roomId), options: CallOptions(
        metadata: {
          "Authorization": "Bearer ${await authRepository.getToken()}"
        }
    ));
    return res.account;
  }
}