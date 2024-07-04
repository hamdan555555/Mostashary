import 'package:http/http.dart' as http;

import '../servceConfig.dart';

class ServicesLogout {
 static getExperts() async {
    try {
      var response =
          await http.get(Uri.parse('${Services.dmainName}user-logout'));
      print('Done');
    } catch (e) {
      print('Error Here');
      print(e);
    }
  }
}
