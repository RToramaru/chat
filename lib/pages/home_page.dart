import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: const Text('R'),
                    ),
                    Text(
                      'Rafael Almeida Soares',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 80,),
                TextField(
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
                        onPressed: () {},
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
              padding: EdgeInsets.all(50),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80))),
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.all(8)
                            ),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 207, 216, 2020)),
                          ),
                          onPressed: () {},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(
                            backgroundColor: Colors.white,
                            child: const Text('G1'),
                          ),
                          Text(
                            'Grupo 1',
                            style: TextStyle(fontSize: 20),
                          ),
                              ]),
                        ),
                        const SizedBox
                        (height: 10,)
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
