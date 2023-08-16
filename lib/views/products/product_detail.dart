// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:testapp/controller/products_controller.dart';
import 'package:testapp/utils/app_colors.dart';
import 'package:testapp/utils/app_size.dart';
import 'package:get/get.dart';
import 'package:testapp/utils/navigator.dart';

import '../../model/products_model.dart';
import '../widget/custom_loading.dart';
import 'widget/app_bar_button.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.productId});
  final int productId;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

ScrollController scrollController = ScrollController();
bool showbtn = false;

class _ProductDetailState extends State<ProductDetail> {
  final controller = Get.put(ProductsController());
  @override
  void initState() {
    scrollController.addListener(() {
      double showoffset = 10.0;

      if (scrollController.offset > showoffset) {
        setState(() {
          showbtn = true;
        });
      } else {
        setState(() {
          showbtn = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        controller: scrollController,
        child: SafeArea(
            child: FutureBuilder<ProductsModel>(
          future: controller.getMovieDeatil(id: widget.productId),
          builder: (context, snapshot) {
            ProductsModel? products = snapshot.data;
            if (!snapshot.hasData) {
              return const CustomLoading();
            } else {
              return Column(
                children: [
                  Container(
                    width: AppSize.width(context),
                    height: AppSize.height(context) * 0.60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(products!.image))),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppBarButton(
                                    color: AppColors.navyblueeColor,
                                    iconData: Icons.arrow_back,
                                    onTap: () {
                                      navigateBack();
                                    },
                                  ),
                                  const Spacer(),
                                  AppBarButton(
                                    color: AppColors.navyblueeColor,
                                    iconData: Icons.more_vert,
                                    onTap: () {},
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Details",
                                    style: TextStyle(
                                        fontSize: 28,
                                        color: AppColors.lightGrey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${products.price} AED",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: AppColors.navyblueeColor,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 40,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Container(
                      width: AppSize.width(context),
                      height: AppSize.height(context) * 0.60,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                scrollController.animateTo(0,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn);
                              },
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 1000),
                                opacity: showbtn ? 1.0 : 1.0,
                                child: showbtn
                                    ? Icon(
                                        Icons.keyboard_arrow_up,
                                        size: 36,
                                        color: AppColors.bgColor1,
                                      )
                                    : Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 36,
                                        color: AppColors.bgColor1,
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSize.height(context) * 0.02,
                          ),
                          Row(
                            children: [
                              AppBarButton(
                                iconData: Icons.save_alt,
                                onTap: () {},
                                color: AppColors.bgColor1,
                              ),
                              SizedBox(
                                width: AppSize.width(context) * 0.06,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.bgColor2,
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      fixedSize: Size(AppSize.width(context),
                                          AppSize.height(context) * 0.06),
                                    ),
                                    onPressed: () async {},
                                    child: const Text(
                                      "Order Now",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppSize.height(context) * 0.02,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Description"),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                products.description,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w200),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: AppSize.width(context),
                              height: AppSize.height(context) * 0.16,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(241, 241, 241, 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Reviews (${products.rating.count})",
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: AppSize.height(context) * 0.02,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${products.rating.rate}",
                                          style: const TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(
                                          width: AppSize.width(context) * 0.05,
                                        ),
                                        RatingBarIndicator(
                                            rating: products.rating.rate,
                                            itemCount: 5,
                                            itemSize: 36.0,
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                )),
                                        const Spacer(),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        )),
      ),
    );
  }
}
