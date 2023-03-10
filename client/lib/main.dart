import 'package:client/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: RouterPage(),
    );
  }
}

class RouterPage extends ConsumerWidget {
  const RouterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: "Chat App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}
//  protoc --dart_out=grpc:client/lib/generated ./proto/message.proto
