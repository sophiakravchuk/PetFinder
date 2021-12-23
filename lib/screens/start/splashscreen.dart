import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lost_animal/screens/auth/starting_page.dart';


import '../../constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateTo();
  }

  _navigateTo() async{
    await Future.delayed(Duration(milliseconds: 1500), (){});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StartScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: DesignConfig.size, allowFontScaling: true);
    return Scaffold(
        backgroundColor: Color(0xFF63B4FF),
        body: SafeArea(
        child: Container(
        child: Center(
        child: ListView(
        children: [
            Column(
            children: [
                const SizedBox(height: 200),
            Image.asset('assets/images/corgi-logo.png',
                    height: 220, width: 220),
          const SizedBox(height: 100),
            Text(
              "PetFinder",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF000066))
          )]
            )
            ]
        )
        )
    )
    ));
  }

}

