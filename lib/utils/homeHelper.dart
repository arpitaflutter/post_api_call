import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:post_api_call/screens/home/model/homeModel.dart';

class homeHelper {
  Future<String> PostApiCall(String p1,String p2,String p3,String p4,String p5,String p6)
  async {
    String link =
        "https://apidatahub.000webhostapp.com/MyShop/API/adddataapi.php";

    Uri uri = Uri.parse(link);

    var json = await http.post(uri, body: {
      "p_name": p1,
      "p_rate": p2,
      "p_price": p3,
      "p_offer": p4,
      "p_desc": p5,
      "p_category": p6
    });

    if(json.statusCode == 200)
      {
        return "success";
      }
    return "Failed";
  }

  Future<List<dynamic>> GetApi()
  async {
    String link = "https://apidatahub.000webhostapp.com/MyShop/API/products.php";

    Uri uri = Uri.parse(link);

    var response = await http.get(uri);

    var json = jsonDecode(response.body);

    List<dynamic> l1 = json.map((e) => UserModel.fromJson(e)).toList();
    return l1;
  }
}
