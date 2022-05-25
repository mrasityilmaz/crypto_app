import 'dart:convert';
import 'dart:developer';
import 'package:crypto_app/Model/api_result_list_model.dart';
import 'package:crypto_app/Model/api_single_result_model.dart';
import 'package:http/http.dart' as http;

class CryptoAPI {
  static Future<ApiResultList> getCurrency() async {
    String apiUri =
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest";
    String query = "?start=1&limit=20&convert=USD";
    Map<String, String> headers = {
      'Accepts': 'application/json',
      'X-CMC_PRO_API_KEY': "YOUR-API-KEY",
    };

    var response = await http.get(Uri.parse(apiUri + query), headers: headers);

    var responseJson = ApiResultList.fromJson(jsonDecode(response.body));

    return responseJson;
  }

  static Future<ApiResult> searchCoin(String searchName) async {
    String apiUri =
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest";
    String query = "?symbol=$searchName";
    Map<String, String> headers = {
      'Accepts': 'application/json',
      'X-CMC_PRO_API_KEY': "YOUR-API-KEY",
    };

    var response = await http.get(Uri.parse(apiUri + query), headers: headers);

    var responseJson = ApiResult.fromJson(jsonDecode(response.body));

    return responseJson;
  }
}
