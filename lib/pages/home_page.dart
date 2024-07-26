import 'package:chatgpt_clone_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../components/chat_content.dart';
import '../services/assets_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bool isTyping = true;
  final TextEditingController chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Image.asset(AssetsManager.openaiLogo),
        ),
        title: const Text("ChatGPT", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded, color: Colors.white)),
        ],
      ),
      body: Column(children: [
        Flexible(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) => ChatContent(
              msg: chatMessages[index]["msg"].toString(),
              chatIndex: int.tryParse(chatMessages[index]["chatIndex"].toString()) ?? 0,
            ),
          ),
        ),
        /* The spread operator in Dart is used to expand an iterable (like a list) into individual elements. */
        if(isTyping) ...[
           const SpinKitThreeBounce(
            color: Colors.white,
            size: 18,
           ),
        ],
        const SizedBox(height: 15),
        Container(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Expanded(child: TextField(
                style: const TextStyle(color: Colors.white),
                controller: chatController,
                decoration: const InputDecoration(
                  hintText: "Message ChatGPT",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              )),
              IconButton(onPressed: () {}, icon: const Icon(Icons.send, color: Colors.white)),
            ]),
          ),
        ),
      ]),
    );
  }
}