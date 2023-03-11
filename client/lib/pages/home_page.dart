import 'package:client/providers/reporitories.dart';
import 'package:client/state/room_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
                onTap: () {
                  context.push("/rooms/${data[index].id}");
                },
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
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return const CreateRoomDialog();
          });
        },
      ),
    );
  }
}

class CreateRoomDialog extends ConsumerStatefulWidget {
  const CreateRoomDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return CreateRoomDialogState();
  }
}
class CreateRoomDialogState extends ConsumerState {

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("部屋を作成"),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          label: Text("部屋名"),
        ),
      ),
      actions: [
        TextButton(onPressed: () {
          ref.read(roomRepositoryProvider).create(name: controller.text).then((value) {
            ref.refresh(allRoomsFutureProvider);
            context.pop();
          });
        }, child: const Text("作成")),
      ],
    );
  }
}
