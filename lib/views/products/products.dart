// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:testapp/model/products_model.dart';
import 'package:testapp/utils/navigator.dart';
import 'package:testapp/views/products/product_detail.dart';

import '../../controller/products_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_size.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../widget/custom_bottom_navigation_bar.dart';
import '../widget/custom_loading.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductsController());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Card(
            elevation: 5,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.appBarColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
              width: AppSize.width(context),
              height: AppSize.height(context) * 0.08,
              alignment: Alignment.center,
              child: Text("All Products",
                  style: TextStyle(
                      color: AppColors.navyblueeColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FutureBuilder<List<ProductsModel>>(
                    future: controller.getProducts(context),
                    builder: (context, snapshot) {
                      List<ProductsModel>? products = snapshot.data;
                      if (!snapshot.hasData) {
                        return const CustomLoading();
                      } else {
                        return SingleChildScrollView(
                          child: SizedBox(
                            width: AppSize.width(context),
                            height: AppSize.height(context) * 0.87,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: products!.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          navigateTo(ProductDetail(
                                            productId: products[index].id,
                                          ));
                                        },
                                        child: SizedBox(
                                          width: AppSize.width(context),
                                          height:
                                              AppSize.height(context) * 0.47,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Card(
                                                elevation: 3,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    29))),
                                                child: Container(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  width: AppSize.width(context),
                                                  height:
                                                      AppSize.height(context) *
                                                          0.28,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              29),
                                                      image: DecorationImage(
                                                          alignment:
                                                              Alignment.center,
                                                          fit: BoxFit.contain,
                                                          image: NetworkImage(
                                                            products[index]
                                                                .image,
                                                          ))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 18.0,
                                                            bottom: 10),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "${products[index].price} AED",
                                                          style: TextStyle(
                                                              fontSize: 28,
                                                              color: AppColors
                                                                  .navyblueeColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        const Spacer(),
                                                        RatingBarIndicator(
                                                            rating:
                                                                products[index]
                                                                    .rating
                                                                    .rate,
                                                            itemCount: 5,
                                                            itemSize: 23.0,
                                                            itemBuilder:
                                                                (context, _) =>
                                                                    const Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .yellow,
                                                                    )),
                                                        SizedBox(
                                                          width: AppSize.width(
                                                                  context) *
                                                              0.02,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    AppSize.height(context) *
                                                        0.02,
                                              ),
                                              Text(
                                                products[index].title,
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              SizedBox(
                                                height:
                                                    AppSize.height(context) *
                                                        0.01,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  products[index].description,
                                                  style: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w200),
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    AppSize.height(context) *
                                                        0.02,
                                              ),
                                              const Divider()
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  )))
        ],
      )),
      bottomNavigationBar: const CustomBottomNavigatonBar(),
    );
  }
}
