import 'package:client/generated/proto/message.pb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2.0, color: Colors.grey),
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(message.author.avatarUrl),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.author.name,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 4),
              Text(message.text),
            ],
          )
        ],
      ),
    );
  }
}
