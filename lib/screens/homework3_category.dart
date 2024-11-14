import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kioway/app_color.dart';
import 'package:kioway/models/slider.dart' as custom_slider;
import 'package:kioway/models/shop_by_category.dart';
import 'package:kioway/widget/about_tab.dart';
import 'package:kioway/widget/custom_tab_bar.dart';
import 'package:kioway/widget/popular_tab.dart';
import 'package:kioway/widget/promotion_tab.dart';
import 'package:kioway/widget/tab_home.dart';

class Homework3Category extends StatefulWidget {
  final int id;
  final String categoryName;
  const Homework3Category({
    super.key,
    required this.id,
    required this.categoryName,
  });

  @override
  State<Homework3Category> createState() => _Homework3CategoryState();
}

class _Homework3CategoryState extends State<Homework3Category>
    with TickerProviderStateMixin {
  late List<ShopByCategory> filteredShops;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    filteredShops = ShopByCategory.shopByCategoryList
        .where((shop) => shop.categoryId == widget.id)
        .toList();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: AppColors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          widget.categoryName,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 120,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                            ),
                            items: custom_slider.Slider.sliderList.map((item) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  item.imageUrl,
                                  fit: BoxFit.cover,
                                  width: 1000,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1 / 2.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(1, 1),
                                  )
                                ],
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  filteredShops[0].imageUrl,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      filteredShops[0].shopName.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 5),
                                    Image.asset(
                                      'assets/icons/verify.png',
                                      width: 20,
                                      height: 20,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      widget.categoryName,
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/icons/store.png',
                              width: 25,
                              height: 25,
                              color: Colors.grey,
                            ),
                            const Text(
                              '76 Orders',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  CustomTabBar(tabController: _tabController),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 250,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        HomeTab(product: filteredShops),
                        const PopularTab(),
                        const PromotionTab(),
                        const AboutTab()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
