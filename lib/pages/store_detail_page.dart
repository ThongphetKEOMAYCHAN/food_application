import 'package:flutter/material.dart';
import 'package:food_application/data/product_json.dart';
import 'package:food_application/theme/color.dart';
import 'package:food_application/theme/padding.dart';

class StoreDetailPage extends StatefulWidget {
  final String image;
  final String name;

  const StoreDetailPage({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  State<StoreDetailPage> createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: getAppBar(), preferredSize: Size.fromHeight(200)),
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.info),
        ),
      ],
      backgroundColor: primary,
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.image), fit: BoxFit.cover)),
          ),
          Container(
            decoration: BoxDecoration(color: textBlack.withOpacity(0.5)),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Text(
                      widget.name,
                      style: const TextStyle(
                          color: textWhite,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2, color: textWhite)),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 12, right: 12, bottom: 8, top: 8),
                      child: Text(
                        "Delevery 10 Min",
                        style: TextStyle(
                            fontSize: 16,
                            color: textWhite,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.star, color: textWhite, size: 18),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "4.5",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: textWhite),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "(2591)",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: textWhite),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Top Menu",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Most ordered  right now",
                  style: TextStyle(fontSize: 15, color: textBlack),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: List.generate(productItems.length, (index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (size.width * 0.75) - 40,
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productItems[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      productItems[index]['price'],
                                      style: const TextStyle(
                                          color: textBlack, fontSize: 16),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      productItems[index]['discount'],
                                      style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: textBlack,
                                          fontSize: 16),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        productItems[index]["image"]),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 0.8,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 90,
      decoration: const BoxDecoration(
          color: textWhite,
          border: Border(
              top: BorderSide(
            width: 1,
            color: textBlack,
          ))),
      child: Row(
        children: [
          Container(
            width: size.width - 40,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: primary),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: textWhite)),
                      child:const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child:  Center(
                          child: Text(
                            "2",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: textWhite),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                            "View your cart",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: textWhite),
                          ),
                          const Text(
                      "\$ 3.98",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: textWhite),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
