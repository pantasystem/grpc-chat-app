import 'dart:async';

import 'package:client/generated/proto/message.pb.dart';
import 'package:client/providers/reporitories.dart';
import 'package:client/repositories/message_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageStore extends ChangeNotifier {
  MessageStore({required this.roomId, required this.repository}) {
    // _subscription = repository.observeMessages(roomId: roomId).listen((element) {
    //   messages = [
    //     ...messages,
    //     element
    //   ];
    //   notifyListeners();
    // });

    fetch();
  }
  final String roomId;
  final MessageRepository repository;

  List<Message> messages = [];
  Future<void> fetch() async {
    repository.findMessages(roomId: roomId).then((value) {
      messages = value;
      notifyListeners();
    });
  }

  void onReceiveNewMessage(Message msg) {
    messages = [
      ...messages,
      msg
    ];
  }

}

final messageStoreProvider = ChangeNotifierProvider.autoDispose.family((ref, String roomId) {
  return MessageStore(roomId: roomId, repository: ref.read(messageRepositoryProvider));
});