import 'package:signin_app/models/user.model.dart';
import 'package:signin_app/repositories/account.repository.dart';
import 'package:signin_app/view-models/signup.viewmodel.dart';

class SignupController {
  AccountRepository repository;

  SignupController() {
    this.repository = new AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.busy = true;
    var user = await this.repository.createAccount(model);
    model.busy = false;

    return user;
  }
}
