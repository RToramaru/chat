import 'package:chat/models/group_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupController {
  final _collection = FirebaseFirestore.instance.collection('grupos');
  List<GroupModel> groups = <GroupModel>[];

  loadData() async {
    groups.clear();
    QuerySnapshot querySnapshot = await _collection.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var group in allData) {
      groups.add(GroupModel.fromMap(group as Map));
    }
  }
}
