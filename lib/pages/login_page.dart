import 'package:chat/controller/user_controller.dart';
import 'package:chat/models/user_model.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late UserController userController;

  @override
  void initState() {
    super.initState();
    userController = UserController(UserModel());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          color: Colors.white,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: double.infinity,
          color: const Color.fromARGB(255, 207, 216, 2020),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 - 75,
          left: MediaQuery.of(context).size.width / 2 - 75,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.black),
              borderRadius: BorderRadius.circular(90),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset(
                'assets/images/logo.jpg',
                height: 150,
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2 + 125,
          right: 25,
          left: 25,
          child: const Text(
            'Interagir com seus amigos e conhecer pessoas novas em um único lugar, acesse e se divirta nos grupos',
            style: TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          bottom: 50,
          width: MediaQuery.of(context).size.width - 60,
          height: 50,
          left: 30,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.black)))),
            onPressed: () async {
              if(await userController.login()){
                Navigator.of(context).pushReplacementNamed('/home', arguments: userController.userModel);
              }
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/google.png',
                height: 30,
              ),
              const Text(
                '    Acessar com o Google',
                style: TextStyle(color: Colors.black),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}
