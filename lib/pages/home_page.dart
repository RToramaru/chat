import 'dart:convert';

import 'package:chat/controller/group_controller.dart';
import 'package:chat/models/user_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GroupController groupController = GroupController();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserModel arguments =
        ModalRoute.of(context)?.settings.arguments as UserModel;
    return Scaffold(
        body: FutureBuilder(
            future: groupController.loadData(),
            builder: (context, snapshot) {
              return Scaffold(
                backgroundColor: const Color.fromARGB(255, 207, 216, 2020),
                body: Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 207, 216, 2020),
                      child: Container(
                        margin: const EdgeInsets.all(60),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child:
                                    Image.network(arguments.image, height: 40),
                              ),
                              Text(
                                arguments.name,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          TextField(
                            controller: controller,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Pesquisar Grupo',
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.black,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.clear();
                                  },
                                  icon: const Icon(
                                    Icons.clear,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                          )
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height - 300,
                        padding: const EdgeInsets.all(50),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(80),
                                topRight: Radius.circular(80))),
                        child: ListView.builder(
                            itemCount: groupController.groups.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry>(
                                          const EdgeInsets.all(8)),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  255, 207, 216, 2020)),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/chat', arguments: {
                                        'name': arguments.name,
                                        'groupName':
                                            groupController.groups[index].group,
                                        'groupImage':
                                            groupController.groups[index].image,
                                      });
                                    },
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            child: Image.memory(
                                                const Base64Decoder().convert(
                                                    groupController
                                                        .groups[index].image),
                                                height: 40),
                                          ),
                                          Text(
                                            groupController.groups[index].group,
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
