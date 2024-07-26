import 'package:chatgpt_clone_app/components/custom_text.dart';
import 'package:chatgpt_clone_app/constants/constants.dart';
import 'package:chatgpt_clone_app/services/assets_manager.dart';
import 'package:flutter/material.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Material(
        color: chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              chatIndex == 0 
              ? AssetsManager.userImage
              : AssetsManager.chatLogo,
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 8),
            Expanded(child: CustomText(label: msg)),
          ]),
        ),
      ),
    ]);
  }
}