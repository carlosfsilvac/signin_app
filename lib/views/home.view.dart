import 'package:flutter/material.dart';
import 'package:signin_app/stores/app.store.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AppStore>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Olá, ${store.name}. Seja bem-vindo! 😁",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
