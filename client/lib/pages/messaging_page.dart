import 'dart:async';

import 'package:client/pages/message_card.dart';
import 'package:client/providers/reporitories.dart';
import 'package:client/state/messaging_state.dart';
import 'package:client/state/room_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  final TextEditingController _textController = TextEditingController();
  final _scrollController = ScrollController();

  StreamSubscription? disposable;
  @override
  void initState() {
    disposable = ref.read(messageRepositoryProvider).observeMessages(roomId: widget.roomId).listen((event) {
      final isBottom = _isScrolledToBottom();
      setState(() {
        ref.read(messageStoreProvider(widget.roomId)).onReceiveNewMessage(event);
        if (isBottom) {
          SchedulerBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
        }
      });

    });
    super.initState();
  }

  @override
  void dispose() {
    disposable?.cancel();
    super.dispose();
  }

  bool _isScrolledToBottom() {
    return _scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent;
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    ref.read(messageRepositoryProvider).create(text: text, roomId: widget.roomId);
  }
  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(hintText: 'Type your message'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final roomState = ref.watch(roomFamilyProvider(widget.roomId));
    final messageStore = ref.watch(messageStoreProvider(widget.roomId));

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messageStore.messages.length,
              itemBuilder: (BuildContext context, index) {
                return MessageCard(message: messageStore.messages[index]);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}
