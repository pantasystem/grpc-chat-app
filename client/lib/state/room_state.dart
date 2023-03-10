
import 'package:client/providers/reporitories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allRoomsFutureProvider = FutureProvider.autoDispose((ref) {
  return ref.read(roomRepositoryProvider).findAll();
});


final joinedRoomsFutureProvider = FutureProvider.autoDispose((ref) async {
  final me = await ref.read(accountRepositoryProvider).findMe();
  return ref.read(roomRepositoryProvider).findJoined(accountId: me.account.id);
});
