import 'dart:convert';
import 'dart:developer';

import 'package:either_dart/either.dart';
import 'package:sneakers_app/data/models/product_model.dart';
import 'package:sneakers_app/utils/api_url.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  var headers = {
    'content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<Either<String, List<ProductModel>>> getProduct() async {
    var url = Uri.parse('${ApiUrl.BASE_URL}${ApiUrl.PRODUCTS_URL}');
    final http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> decodedResponse = jsonDecode(response.body);
      List<ProductModel> products = decodedResponse.map((productJson)
          => ProductModel.fromJson(productJson)).toList();
      return Right(products);
    } else {
      log('API Error ${response.statusCode} . ${response.body}//////////');
      return Left(jsonDecode(response.body)['message'] ?? "Unknown error occurred");
    }
  }
}
