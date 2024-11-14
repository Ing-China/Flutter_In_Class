import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kioway/app_color.dart';
import 'package:kioway/screens/homework3_category.dart';
import 'package:kioway/screens/root_screen.dart';
import 'package:kioway/models/slider.dart' as custom_slider;
import 'package:kioway/models/category.dart';
import 'package:page_transition/page_transition.dart';

class Homework3 extends StatefulWidget {
  const Homework3({super.key});

  @override
  State<Homework3> createState() => _Homework3State();
}

class _Homework3State extends State<Homework3> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/hamburger.svg',
            width: 20.0,
            height: 20.0,
            color: AppColors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/scan.svg',
              width: 20,
              height: 20,
              color: AppColors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 20,
              height: 20,
              color: AppColors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/cart.svg',
              width: 20,
              height: 24,
              color: AppColors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const RootScreen(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 180,
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
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: Category.categoryList.map((category) {
                  return cartCategory(
                      context, category.id, category.name, category.imageUrl);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget cartCategory(
    BuildContext context, int id, String name, String imageUrl) {
  return Container(
    child: Card(
      color: AppColors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
                child: Homework3Category(id: id, categoryName: name),
                type: PageTransitionType.rightToLeft),
          );
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ],
        ),
      ),
    ),
  );
}
