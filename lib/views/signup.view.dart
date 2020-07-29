import 'package:flutter/material.dart';
import 'package:signin_app/controllers/signup.controller.dart';
import 'package:signin_app/stores/app.store.dart';
import 'package:signin_app/view-models/signup.viewmodel.dart';
import 'package:signin_app/views/home.view.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _controller = new SignupController();
  var model = new SignupViewModel();

  @override
  Widget build(BuildContext context) {
    // Utiliza o provider store, que é um singleton
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    "Cadastre-se",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) return "Nome inválido";

                      return null;
                    },
                    onSaved: (value) {
                      model.name = value;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) return "E-mail inválido";

                      return null;
                    },
                    onSaved: (value) {
                      model.email = value;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) return "Senha inválida";

                      return null;
                    },
                    onSaved: (value) {
                      model.password = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 26.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 40.0,
                      child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        child: model.busy
                            ? Container(
                                height: 15.0,
                                width: 15.0,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ),
                              )
                            : Text(
                                "Cadastrar",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                        onPressed: model.busy
                            ? () {}
                            : () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                }

                                setState(() {
                                  _controller.create(model).then((data) => {
                                        setState(() {}),
                                        store.setUser(
                                          data.name,
                                          data.email,
                                          data.picture,
                                          data.token,
                                        ),
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeView(),
                                          ),
                                        ),
                                      });
                                });
                              },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
