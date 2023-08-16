// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:testapp/model/products_model.dart';

import '../utils/constants.dart';
import '../views/widget/custom_snackbar.dart';

class ApiServices {
  Future<List<ProductsModel>> getAllProducts() async {
    final http.Response response = await http.get(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.getAllProducts),
    );
    try {
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        List jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((data) => ProductsModel.fromJson(data))
            .toList();
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        throw Exception('Failed gettingProducts');
      }
    } catch (e) {
      throw Exception('Failed gettingProducts');
    }
  }

  Future<String> userLogin({
    required String username,
    required String password,
  }) async {
    final http.Response response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}auth/login?'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "username": username,
        "password": password,
      }),
    );
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
      }
      var jsonData = jsonDecode(response.body);
      return jsonData['token'];
    } else if (response.statusCode == 401) {
      return customSnakBar(color: Colors.red, msg: response.body);
    } else {
      if (kDebugMode) {
        print(response.body);
      }
      throw Exception('Failed login');
    }
  }

  Future<ProductsModel> getAllProductDeatils({required int id}) async {
    final http.Response response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.getAllProducts}/$id'),
    );
    try {
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.body);
        }
        return ProductsModel.fromJson(json.decode(response.body));
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        throw Exception('Failed gettingProductsDetails');
      }
    } catch (e) {
      throw Exception('Failed gettingProductsDetails');
    }
  }
}
