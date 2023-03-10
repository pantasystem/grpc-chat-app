import 'package:client/state/room_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagingPage extends ConsumerStatefulWidget {
  const MessagingPage({super.key, required this.roomId});

  final String roomId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return MessagingPageState();
  }
}

class MessagingPageState extends ConsumerState<MessagingPage> {
  @override
  Widget build(BuildContext context) {
    final roomState = ref.watch(roomFamilyProvider(widget.roomId));
    return Scaffold(
      appBar: AppBar(
        title: roomState.when(
          data: (data) {
            return Text(data.name);
          },
          error: (e, st) {
            return const Text("Error");
          },
          loading: () {
            return const Text("メッセージ");
          },
        ),
      ),
    );
  }
}
