import 'package:client/repositories/AccountRepository.dart';
import 'package:client/repositories/AuthRepository.dart';
import 'package:client/repositories/RoomRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'grpc.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository();
});

final accountRepositoryProvider = Provider((ref) {
  return AccountRepository(
    client: ref.read(accountClientProvider),
    authRepository: ref.read(authRepositoryProvider),
  );
});

final roomRepositoryProvider = Provider((ref) {
  return RoomRepository(
    authRepository: ref.read(authRepositoryProvider),
    client: ref.read(roomClientProvider),
  );
});
