import 'package:flutter/material.dart';
import 'package:food_application/theme/color.dart';
import 'package:food_application/theme/padding.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    return Padding(
      padding: const EdgeInsets.all(mainPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Foodies",
                style: TextStyle(
                    color: primary, fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Phone Number',
                style: TextStyle(
                    fontSize: 16, color: grey, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 54,
                decoration: BoxDecoration(
                    color: textFieldBg, borderRadius: BorderRadius.circular(5)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: TextField(
                    cursorColor: textBlack,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Pone Number"),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Password",
                style: TextStyle(
                    fontSize: 16, color: grey, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    color: textFieldBg, borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: const [
                      Flexible(
                        child: TextField(
                          obscureText: true,
                          cursorColor: textBlack,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Password"),
                        ),
                      ),
                      Icon(
                        Icons.remove_red_eye,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/root_app", (route) => false);
            },
            child: Container(
              width: 141,
              height: 45,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Login",
                    style: TextStyle(
                        color: textWhite,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: const [
              Text(
                "Does not have an account yet ? ",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              Text(
                "Create One",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
