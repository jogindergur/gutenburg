import 'package:http/http.dart' as http;

class BaseGetAPI {
  
  getData(String url) async {
    return await http.get(Uri.parse(url), headers: <String, String>{
      'Accept': '*/*',
      'Content-Type': 'application/x-www-form-urlencoded',
    });
  }
}
