import 'package:mobx/mobx.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

/*

 * #### Como funciona o store do Mobx ####

 * Sempre que alguma view ou widget precisar ler/utilizar alguma propriedade 
 * do store, ficará conectado ao mesmo e sempre que o valor desta propriedade
 * for modificado, o widget atualiza e renderiza automaticamente, sem a
 * necessidade do uso do setState().
 
 */
abstract class _AppStore with Store {
  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String picture = "htts://placehold.it/200";

  @observable
  String token = "";

  @action
  void setUser(String _name, String _email, String _picture, String _token) {
    name = _name;
    email = _email;
    picture = _picture;
    token = _token;
  }
}
