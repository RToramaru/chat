class ChatModel {
  String message = '';
  String user = '';
  String type = '';
  String date = '';

  ChatModel();

  generateChat(String messageParams, String userParam, String typeParam) {
    message = messageParams;
    user = userParam;
    type = typeParam;
    date = DateTime.now().toString();
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'message': message,
      'user': user,
      'type': type,
      'date': date,
    };
    return map;
  }

  ChatModel.fromMap(Map<dynamic, dynamic> map) {
    message = map['message'];
    user = map["user"];
    type = map["type"];
    date = map["date"];
  }
}
