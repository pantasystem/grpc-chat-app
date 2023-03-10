import 'package:client/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final _initialLoadProvider = FutureProvider.autoDispose((ref) {
  return ref.read(authStoreProvider).fetch();
});
class InitialLoadingPage extends ConsumerWidget {
  const InitialLoadingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(_initialLoadProvider);
    return const Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}