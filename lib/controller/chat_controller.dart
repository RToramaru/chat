import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';

import 'package:chat/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ChatController {
  final _collection = FirebaseFirestore.instance;
  List<ChatModel> chats = <ChatModel>[];
  ChatModel chatModel = ChatModel();

  addListChats(Map map){
    chats.add(ChatModel.fromMap(map));
  }

  loadData(String dataBase) {
    return  _collection.collection(dataBase).snapshots();
  }

  sendData(String dataBase, Map<String, dynamic> map) {
    _collection.collection(dataBase).doc(DateTime.now().toString()).set(map);
  }

  openGallery(String dataBase, String user) async {
    final picker = ImagePicker();
    try {
      XFile? fileImage = await picker.pickImage(source: ImageSource.gallery);
      if (fileImage != null) {
        File file = File(fileImage.path);
        Uint8List bytes = file.readAsBytesSync();
        chatModel.generateChat(base64Encode(bytes), user, 'image');
        sendData(dataBase, chatModel.toMap());
      }
    } catch (e) {
      return null;
    }
  }
}
