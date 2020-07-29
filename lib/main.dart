import 'package:flutter/material.dart';
import 'package:signin_app/stores/app.store.dart';
import 'package:signin_app/views/signup.view.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
     * O provider cria um singleton para que seja possível utilizar
     * a store em toda a aplicação, guardando os dados em memória. 
     */
    return MultiProvider(
      providers: [
        Provider<AppStore>.value(
          value: AppStore(),
        ),
      ],
      child: MaterialApp(
        title: 'LoginApp',
        home: SignupView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
