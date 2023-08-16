// ignore_for_file: depend_on_referenced_packages

import 'package:testapp/model/products_model.dart';

import '../services/api_services.dart';
import 'package:get/get.dart';

import '../views/widget/custom_flushbar_message.dart';

class ProductsController extends GetxController {
  List<ProductsModel> productsModel = [];
  ProductsModel? productsDetail;
  String userToken = '';

  Future<List<ProductsModel>> getProducts(context) async {
    try {
      productsModel = await ApiServices().getAllProducts();
    } catch (e) {
      CustomFlushBarMessage.flushBarErrorMsg('Something Went Wrong', context);
    }
    return productsModel;
  }

  Future<String> userLogin(
      {context, required String username, required String passwrod}) async {
    try {
      userToken = await ApiServices().userLogin(
        password: passwrod,
        username: username,
      );
    } catch (e) {
      CustomFlushBarMessage.flushBarErrorMsg('Something Went Wrong', context);
    }
    return userToken;
  }

  Future<ProductsModel> getMovieDeatil({context, required int id}) async {
    try {
      productsDetail = await ApiServices().getAllProductDeatils(id: id);
    } catch (e) {
      CustomFlushBarMessage.flushBarErrorMsg('Something Went Wrong', context);
    }
    return productsDetail!;
  }
}
