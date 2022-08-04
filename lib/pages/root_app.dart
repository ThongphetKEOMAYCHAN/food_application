import 'package:flutter/material.dart';
import 'package:food_application/pages/home_page.dart';
import '../theme/color.dart';




class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();

}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        HomePage(),
        Center(
          child: Text(
            "Order",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Center(
          child: Text(
            "Notification",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Center(
          child: Text(
            "Profile",
            style: TextStyle(fontSize: 20),
          ),
        ),
       
      ],
    );
  }


  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.home_outlined,
      Icons.shopping_bag_outlined,
      Icons.notifications_off_outlined,
      Icons.person
    ];
    List textItems = ["Home", "Order", "Notifications", "Profile"];
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
          color: textWhite,
          border: Border(
            top: BorderSide(width: 2, color: textBlack.withOpacity(0.06)),
          )),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, bottom: 20.0, top: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(iconItems.length, (index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(children: [
                  Icon(
                    iconItems[index],
                    color: pageIndex == index ? primary : textBlack,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    textItems[index],
                    // color: pageIndex == index ? primary : textBlack,
                    style: TextStyle(
                        fontSize: 10,
                        color: pageIndex == index ? primary : textBlack),
                  )
                ]),
              );
            })),
      ),
    );
  }
}
