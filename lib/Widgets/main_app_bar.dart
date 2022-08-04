import 'package:flutter/material.dart';
import '../theme/color.dart';
import '../theme/fontsize.dart';
import '../theme/padding.dart';

class MainAppBar extends StatelessWidget {

    const MainAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.8,
      brightness: Brightness.light,
      backgroundColor: textWhite,
      automaticallyImplyLeading: false,
      primary: false,
      excludeHeaderSemantics: true,
      flexibleSpace: SafeArea(
        child: Container(
          padding:
            const  EdgeInsets.only(left: leftMainPadding, right: rightMainPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Delivery Details",
                        style: TextStyle(
                            color: textBlack,
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_right_outlined),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/checkout");
                        },
                        icon: Icon(Icons.add_shopping_cart_outlined),
                        // icon: Badge(
                        //   badgeContent: Text(
                        //     '2',
                        //     style: TextStyle(color: textWhite),
                        //   ),
                        //   child: Icon(
                        //     Icons.card,
                        //     size: 30,
                        //   ),
                        // )
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                // width: (size.width - (leftMainPadding + rightMainPadding + 60)),
                child: Text(
                  "66 Preah Monivong BLVD (93), Phonm Penh 66 Preah Monivong",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: primary, fontSize: subTitleFontSize),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
