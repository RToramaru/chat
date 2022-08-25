import 'package:chat/models/group_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GroupController {
  final _collection = FirebaseFirestore.instance.collection('grupos');
  List<GroupModel> groups = <GroupModel>[];
  List<GroupModel> groupsData = <GroupModel>[];

  loadData() async {
    groups.clear();
    QuerySnapshot querySnapshot = await _collection.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var group in allData) {
      groups.add(GroupModel.fromMap(group as Map));
    }
  }

  searchData(String item) async {
    groups.clear();
    await loadData();
    groupsData.clear();
    for (int i = 0; i < groups.length; i++) {
      if (groups[i].group.toLowerCase().contains(item.toLowerCase())) {
        groupsData.add(groups[i]);
      }
    }
    groups.clear();
    for (int i = 0; i < groupsData.length; i++) {
      groups.add(groupsData.elementAt(i));
    }
  }
}
