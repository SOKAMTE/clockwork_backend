import 'package:flutter/widgets.dart';

class Auth extends ChangeNotifier {
  bool _isloggedIn = false;

  bool get authenticated => _isloggedIn;

  void login(Map creds) {
    print(creds);
    _isloggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isloggedIn = false;
    notifyListeners();
  }
}
