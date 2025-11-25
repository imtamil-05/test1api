import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:theme/Model/ProductModel.dart';
class ApiServices {
  static const String baseUrl = 'https://api.tvmaze.com/shows';
  static const String searchUrl = 'https://api.tvmaze.com/search/shows?q={query}';

  static Future<List<Productmodel>> fetchshows() async{
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Productmodel.fromJson(e)).toList();
    } else { 
      throw Exception('Failed to load album');
    }
  }


 static Future<List<Productmodel>> fetchSearch(String query) async{
    final url=searchUrl.replaceAll('{query}', query ); 
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data
      .map((e) => Productmodel.fromJson(e))
      .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

static double _assignPrice(int id) {
  switch (id) {
    case 1:
      return 120.0;
    case 2:
      return 200.0;
    case 3:
      return 150.0;
    default:
      return 99.0; // default price
  }
}
 static List<Productmodel> parseProducts(List<dynamic> jsonList) {
    return jsonList.map((json) {
      Productmodel product = Productmodel.fromJson(json);

      double manualPrice = _assignPrice(product.id);

      return Productmodel(
        id: product.id,
        name: product.name,
        summary: product.summary,
        category: product.category,
        image: product.image,
        rating: product.rating,
        price: manualPrice, // override price manually
      );
    }).toList();
  }
}


  // Future<String> getSearchUrl(String query) async => searchUrl.replaceAll('{query}', query ?? ''    );

  // // Future<Iterable> fetchData() async {
  // //   final response = await http.get(Uri.parse(baseUrl));
  // //   return json.decode(response.body);
  // // }
  
  // Future<Iterable> fetchSearchData(String query) async {
  //   final response = await http.get(Uri.parse(await getSearchUrl(query)));
  //   return json.decode(response.body);
  // }


  // static Future<List<dynamic>> fetchData() async{
  //   final url=Uri.parse(baseUrl);  
  //   final response = await http.get(url);
  
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return jsonDecode(response.body);
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }

  // }
