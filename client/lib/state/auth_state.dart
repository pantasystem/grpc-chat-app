
import 'package:client/repositories/AccountRepository.dart';
import 'package:client/repositories/AuthRepository.dart';
import 'package:flutter/cupertino.dart';

class AuthState extends ChangeNotifier {
  AuthState({required this.authRepository, required this.accountRepository});
  final AuthRepository authRepository;
  final AccountRepository accountRepository;

  AuthStateType type = AuthStateType.loading;

  Future<void> fetch() async {
    final token = await authRepository.getToken();
    if (token == null) {
      type = AuthStateType.error;
      notifyListeners();
      return;
    }

  }
}

enum AuthStateType {
  loading, authorized, error
}