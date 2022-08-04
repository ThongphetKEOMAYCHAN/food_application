import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_application/Widgets/dish_card.dart';
import 'package:food_application/pages/store_detail_page.dart';
import 'package:food_application/theme/color.dart';
import 'package:food_application/theme/helper.dart';
import 'package:food_application/theme/padding.dart';
import '../Widgets/main_app_bar.dart';
import '../theme/fontsize.dart';
import '../data/category_json.dart';
import '../data/store_json.dart';
import '../Widgets/store_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: textWhite,
      appBar: PreferredSize(
          child: MainAppBar(size: size), preferredSize: Size.fromHeight(80)),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: getHeight(size.width, "20:10"),
            // child: Image.asset(
            //   getImage("food1.jpg"),
            //   fit: BoxFit.cover,
            // ),
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUt8jXngp4Rd9CtzTP_L1BjZlvsoW6V2KJUA&usqp=CAU",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: mainPadding, bottom: mainPadding),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    storeTypes.length,
                    (index) {
                      return Container(
                        width: 120,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                                image:
                                    NetworkImage(storeTypes[index]["image"])),
                            SizedBox(
                              height: 5,
                            ),
                            Text(storeTypes[index]["name"])
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: topMainPadding, bottom: bottomMainPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Text(
                      "Special Offers",
                      style: TextStyle(
                          fontSize: titleFontSize, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(storeItems.length, (index) {
                        var store = storeItems[index];
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: leftMainPadding, right: rightMainPadding),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => 
                                      StoreDetailPage(
                                        image: store['image'],
                                        name: store['name'],
                                      ),
                                    ));
                              },
                              child: Container(
                                child: StoreCard(store: store),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: rightMainPadding),
                          child: GestureDetector(
                             onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StoreDetailPage(
                                      image: store['image'],
                                      name: store['name'],
                                    ),
                                  ));
                            },
                            child: Container(
                              child: StoreCard(width: 280, store: store),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: topMainPadding, bottom: bottomMainPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Text(
                      "Recommeded Deished",
                      style: TextStyle(
                          fontSize: titleFontSize, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(storeItems.length, (index) {
                        var dishes = storeItems[index];
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: leftMainPadding, right: rightMainPadding),
                            child: GestureDetector(
                               onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StoreDetailPage(
                                        image: dishes['image'],
                                        name: dishes['name'],
                                      ),
                                    ));
                              },
                              child: Container(
                                child: StoreCard(width: 180, store: dishes),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: rightMainPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StoreDetailPage(
                                      image: dishes['image'],
                                      name: dishes['name'],
                                    ),
                                  ));
                            },
                            child: Container(
                              child: StoreCard(width: 180, store: dishes),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: light),
            child: Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: List.generate(storeList.length, (index) {
                        return Padding(
                          padding:
                              const EdgeInsets.only(bottom: bottomMainPadding),
                          child: GestureDetector(
                             onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => StoreDetailPage(
                                      image: storeList[index]['image'],
                                      name: storeList[index]['name'],
                                    ),
                                  ));
                            },
                            child: Container(
                              child: StoreCard(
                                width: size.width - (mainPadding * 2),
                                store: storeList[index],
                              ),
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
