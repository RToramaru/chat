import 'dart:convert';

import 'package:chat/controller/chat_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController controller = TextEditingController();
  ChatController chatController = ChatController();
  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.memory(
                  const Base64Decoder().convert(arguments['groupImage']),
                  height: 40),
            ),
            Text(arguments['groupName']),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 207, 216, 2020),
      ),
      body: StreamBuilder(
          stream: chatController.loadData(arguments['groupName']),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              int size = snapshot.data?.docs.length as int;
              chatController.chats.clear();
              for (int i = 0; i < size; i++) {
                chatController
                    .addListChats(snapshot.data?.docs[i].data() as Map);
              }
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: chatController.chats.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          alignment: (chatController.chats[index].user ==
                                  arguments['name'])
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Container(
                                  alignment:
                                      (chatController.chats[index].user ==
                                              arguments['name'])
                                          ? Alignment.topLeft
                                          : Alignment.topRight,
                                  child: Text(
                                    chatController.chats[index].user,
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                if (chatController.chats[index].type == 'image')
                                  Container(
                                    alignment:
                                        (chatController.chats[index].user ==
                                                arguments['name'])
                                            ? Alignment.topLeft
                                            : Alignment.topRight,
                                    child: Image.memory(
                                        const Base64Decoder().convert(
                                            chatController
                                                .chats[index].message),
                                        height: 200),
                                  )
                                else
                                  Container(
                                      alignment:
                                          (chatController.chats[index].user ==
                                                  arguments['name'])
                                              ? Alignment.topLeft
                                              : Alignment.topRight,
                                      child: Text(
                                        chatController.chats[index].message,
                                        style: const TextStyle(fontSize: 25),
                                      )),
                                Container(
                                  alignment:
                                      (chatController.chats[index].user ==
                                              arguments['name'])
                                          ? Alignment.topLeft
                                          : Alignment.topRight,
                                  child: Text(
                                    chatController.chats[index].date,
                                    style: const TextStyle(fontSize: 8),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    minLines: 1,
                    maxLines: 5,
                    controller: controller,
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Digitar mensagem ...',
                        prefixIcon: IconButton(
                          onPressed: () {
                            chatController.openGallery(
                                arguments['groupName'], arguments['name']);
                          },
                          icon: const Icon(
                            Icons.image,
                            color: Colors.black,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            chatController.chatModel.generateChat(
                                controller.text, arguments['name'], 'text');
                            chatController.sendData(arguments['groupName'],
                                chatController.chatModel.toMap());
                            controller.clear();
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                  ),
                )
              ],
            );
          }),
    );
  }
}
