import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lost_animal/screens/auth/log_in_page.dart';
import 'package:lost_animal/screens/auth/sing_up_page.dart';


import '../../constants.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: DesignConfig.size, allowFontScaling: true);
    return authFirstPage();
  }

  Widget authFirstPage() {
    return Scaffold(
        appBar: myAppBar(),
        body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 250),
        child: ListView(
        children: [
        Column(
        children: [
          logInButton(),
          SizedBox(
            height: 10.h,
          ),
          singUpButton()
        ]
        )
        ],
        )
        ),
        ),
    );
  }
  Widget logInButton() {
    return Container(
      width: 260.0.w,
      height: 65.0.h,
      child: FloatingActionButton(
        backgroundColor: Color(0xFF63B4FF),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(
          'Log in',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LogInScreen())
          );
        },
      ),
    );
  }

  Widget singUpButton() {
    return Container(
      width: 260.0.w,
      height: 65.0.h,
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(
          'Sign up',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
        ),
        onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SingUpScreen())
            );
        },
      ),
    );
  }

  Widget myAppBar() {
    return
      AppBar(
        title:
        Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Text(
            'PetFinder',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.green,
        elevation: 0,
      );
  }

}

