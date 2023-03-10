

import 'package:client/generated/proto/account.pbgrpc.dart';
import 'package:client/repositories/AuthRepository.dart';
import 'package:grpc/grpc.dart';

class AccountRepository {
  AccountRepository({
    required this.client,
    required this.authRepository,
  });
  final AccountServiceClient client;
  final AuthRepository authRepository;

  Future<Account> create({required String name, required String avatarUrl}) async {
    final res = await client.createAccount(CreateAccountRequest(
      name: name,
      avatarUrl: avatarUrl
    ));
    await authRepository.saveToken(token: res.token);
    return res.account;
  }

  Future<Account> find({required String accountId}) async {
    final res = await client.find(FindUser(id: accountId), options: CallOptions(metadata: {
      "Authorization": "Bearer ${await authRepository.getToken()}"
    }));

    return res;
  }

}