import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoding(bool value) {
    _loading = value;
    notifyListeners();
  }

  void Login(String email, String password) async {
    setLoding(true);
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        print(response.statusCode);
        print("Api hit ho chiki h ji");
        setLoding(false);
      } else {
        print("APi is hiting but worn statuscode");
        print(response.statusCode);
        setLoding(false);

      }
    } catch (e) {
      print(e.toString());
      setLoding(false);

    }
  }
}
