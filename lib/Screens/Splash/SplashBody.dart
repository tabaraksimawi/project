import 'package:flutter/material.dart';
import '../Core/Component/DefaultButton.dart';
import '../Core/Component/DefaultElements.dart';
import 'package:myshopping_app/Providers/userProvider.dart';
import 'package:myshopping_app/Screens/auth/SignIn/SignInScreen.dart';
import 'package:provider/provider.dart';

import '../Core/SizeConfig.dart';
import 'SplashContent.dart';
import 'SplashScreen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"text": "Welcome, Let’s shop!", "image": "assets/images/splash20 (1).png"},
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash22.png"
    },
    {
      "text": "We show the easy way to shop and pay. \nJust stay home ",
      "image": "assets/images/splash33.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    final _userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 1),
                    DefaultButton(
                      text: "Log In",
                      onPressed: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                    DefaultButton(
                      text: "Continue As A Guest",
                      onPressed: () async {
                        await _userProvider.logInAsGuest();
                        Navigator.pushNamed(context, SplashScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: DefaultElements.kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? DefaultElements.kPrimaryColor
            : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
