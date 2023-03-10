
import 'package:client/generated/proto/room.pb.dart';
import 'package:client/providers/reporitories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allRoomsFutureProvider = FutureProvider.autoDispose((ref) {
  return ref.read(roomRepositoryProvider).findAll();
});


final joinedRoomsFutureProvider = FutureProvider.autoDispose((ref) async {
  final me = await ref.read(accountRepositoryProvider).findMe();
  return ref.read(roomRepositoryProvider).findJoined(accountId: me.account.id);
});

final roomFamilyProvider = FutureProvider.autoDispose.family<Room, String>((ref, String id) {
  return ref.read(roomRepositoryProvider).findOne(roomId: id);
});