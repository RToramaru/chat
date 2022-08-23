import 'package:chat/models/user_model.dart';

class UserController{
  final UserModel userModel;

  UserController(this.userModel);

  login(){
    return userModel.login();
  }
}