
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
}