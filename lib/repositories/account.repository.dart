import 'package:signin_app/models/user.model.dart';
import 'package:signin_app/view-models/signup.viewmodel.dart';

class AccountRepository {
  Future<UserModel> createAccount(SignupViewModel model) async {
    await Future.delayed(new Duration(milliseconds: 1000));
    return new UserModel(
      id: "1",
      name: model.name,
      email: model.email,
      picture: "https://picsum.photos/200/200",
      role: "student",
      token: "XPTO123",
    );
  }
}
