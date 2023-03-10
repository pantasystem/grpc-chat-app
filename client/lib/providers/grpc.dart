import 'package:client/generated/proto/account.pbgrpc.dart';
import 'package:client/generated/proto/message.pbgrpc.dart';
import 'package:client/generated/proto/room.pbgrpc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

final channelProvider = Provider((ref) {
  return ClientChannel('10.0.2.2',
      port: 8080,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ));
});

final accountClientProvider = Provider((ref) {
  return AccountServiceClient(ref.read(channelProvider));
});

final roomClientProvider = Provider((ref) {
  return RoomServiceClient(ref.read(channelProvider));
});

final messageClientProvider = Provider((ref) {
  return MessageServiceClient(ref.read(channelProvider));
});
