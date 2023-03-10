import 'package:client/state/room_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final roomsState = ref.watch(allRoomsFutureProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("部屋一覧"),
      ),
      body: roomsState.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(data[index].name),
              );
            },
          );
        },
        error: (e, st) {
          return Center(
            child: Column(
              children: [
                const Text("Error"),
                Text("$e, $st"),
              ],
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
