import 'package:client/state/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final inputNameController = TextEditingController();
  final inputAvatarUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("登録"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: inputNameController,
                      decoration: const InputDecoration(label: Text("名前")),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      controller: inputAvatarUrlController,
                      decoration: const InputDecoration(
                        label: Text("アバター画像URL"),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(authStoreProvider)
                        .register(
                          name: inputNameController.text,
                          avatarUrl: inputAvatarUrlController.text,
                        )
                        .catchError((e, st) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("登録に失敗")));
                    }).then((value) {
                      context.go("/home");
                    });
                  },
                  child: const Text("次へ")),
            ],
          )),
    );
  }
}
