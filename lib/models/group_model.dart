class GroupModel {
  String group = '';
  String image = '';

  GroupModel.fromMap(Map<dynamic, dynamic> map) {
    group = map['grupo'];
    image = map['imagem'];
  }
}
