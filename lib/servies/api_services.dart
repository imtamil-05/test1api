import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiServices {
  static String baseUrl = ' https://api.tvmaze.com/shows';
  static String searchUrl = 'https://api.tvmaze.com/search/shows?q={query}';

  Future<String> getSearchUrl(String query) async => searchUrl.replaceAll('{query}', query ?? ''    );

  // Future<Iterable> fetchData() async {
  //   final response = await http.get(Uri.parse(baseUrl));
  //   return json.decode(response.body);
  // }
  
  Future<Iterable> fetchSearchData(String query) async {
    final response = await http.get(Uri.parse(await getSearchUrl(query)));
    return json.decode(response.body);
  }


  static Future<List<dynamic>> fetchData() async{
    final url=Uri.parse(baseUrl);  
    final response = await http.get(url);
  
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }

  }
}