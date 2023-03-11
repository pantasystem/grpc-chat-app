import 'package:client/generated/proto/message.pbgrpc.dart';
import 'package:client/repositories/auth_repository.dart';
import 'package:grpc/grpc.dart';

class MessageRepository {
  MessageRepository({required this.client, required this.authRepository});

  final MessageServiceClient client;
  final AuthRepository authRepository;

  Future<List<Message>> findMessages({required String roomId}) async {
    final res = await client.findAllMessages(
      FindAllMessagesRequest(roomId: roomId),
      options: CallOptions(
        metadata: {
          "Authorization": "Bearer ${await authRepository.getToken()}"
        },
      ),
    );
    return res.messages;
  }

  Future<Message> create({required String text}) async {
    return await client.createMessage(
      CreateMessageRequest(
      text: text,
      ),
      options: CallOptions(
        metadata: {
          "Authorization": "Bearer ${await authRepository.getToken()}"
        },
      ),
    );
  }

  Stream<Message> observeMessages({required String roomId}) {
    return client.observeMessages(ObserveMessageRequest(roomId: roomId));
  }
}
