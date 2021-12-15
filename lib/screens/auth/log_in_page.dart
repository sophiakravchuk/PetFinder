import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/blocs/authlogin_bloc/authlogin_event.dart';

import 'package:lost_animal/screens/personal_info/profile_screen.dart';
import 'package:lost_animal/blocs/authlogin_bloc/authlogin_bloc.dart';
import 'package:lost_animal/blocs/authlogin_bloc/authlogin_state.dart';
import 'package:lost_animal/widgets/tabsbar.dart';


import '../../constants.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  @override
  void initState() {
    BlocProvider.of<AuthLogInBloc>(context).add(AuthLogInEnter());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: DesignConfig.size, allowFontScaling: true);
    return BlocBuilder<AuthLogInBloc, AuthLogInState>(
        builder: (context, state) {
          if (state is AuthLogInEntered) {

          }
          return authLogInPage();
        });
  }

  Widget authLogInPage() {
    return Scaffold(
      appBar: myAppBar(),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 140),
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        'Log into user account',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(35, 20, 35, 0),
                      child: Text(
                        'Fill in fields, providing personal information asked bellow to enter your user account.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    inputField("Personal information", "Enter your Username/Phone/Email", TextInputType.text, false),
                    inputField("Password","Enter your password here", TextInputType.visiblePassword, true),
                    SizedBox(
                      height: 20.h,
                    ),
                    _logInButton(),
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget inputField(String label, String hint, TextInputType inputType, bool obscureFlag) {
    return Container(
      width: 300.0.w,
      height: 65.0.h,
      child: TextField(
        keyboardType: inputType,
        obscureText: obscureFlag,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
          labelText: label,
        ),
        onChanged: (String value) {},
      ),
    );
  }



  Widget _logInButton() {
    return Container(
      width: 200.0.w,
      height: 55.0.h,
      child: FloatingActionButton(
        heroTag: "login_button",
        backgroundColor: Colors.green,
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
              MaterialPageRoute(builder: (context) => TabsBarScreen())
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

