import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lost_animal/blocs/start_bloc/start_bloc.dart';
import 'package:lost_animal/blocs/start_bloc/start_event.dart';
import 'package:lost_animal/blocs/start_bloc/start_state.dart';
import 'package:lost_animal/screens/auth/log_in_page.dart';
import 'package:lost_animal/screens/auth/sing_up_page.dart';
import 'package:lost_animal/widgets/app_bar.dart';
import 'package:lost_animal/widgets/tabbar.dart';

import '../../constants.dart';
import '../../local_storage.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {

  LocalStorage storage;
  bool register;

  @override
  void initState() {
    BlocProvider.of<StartBloc>(context).add(RegisterInfoLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: DesignConfig.size, allowFontScaling: true);
    return BlocListener<StartBloc, StartState>(
        listener: (BuildContext context, StartState state) {
          if (state is RegisterInfoLoaded) {
            this.register = state.registered;
          }
          if (register == null) {
            return Center(child: loadingCircle());
          } else if (register == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TabBarScreen(),
              ),
            );
          } else {
            return authFirstPage();
          }
        },
        child: authFirstPage()
    );
  }

  Widget authLoadPage() {
    return Scaffold(
      appBar: myAppBar("PetFinder", false),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 250),
            child: ListView(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Center(child: loadingCircle())
                    ]
                )
              ],
            )
        ),
      ),
    );
  }

  Widget authFirstPage() {
    return Scaffold(
      appBar: myAppBar("PetFinder", false),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 250),
            child: ListView(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
        heroTag: "login_button",
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
        heroTag: "signup_button",
        backgroundColor: Color(0xFF000066),
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


  Widget loadingCircle() {
    Widget indicator = CupertinoActivityIndicator();
    return indicator;
  }
}

