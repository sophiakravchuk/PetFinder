import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lost_animal/blocs/pesonalInfo_bloc/personalInfo_bloc.dart';
import 'package:lost_animal/blocs/pesonalInfo_bloc/personalInfo_event.dart';
import 'package:lost_animal/blocs/pesonalInfo_bloc/personalInfo_state.dart';
import 'package:lost_animal/screens/advert_list_screen/advert_list_screen.dart';
import 'package:lost_animal/screens/auth/starting_page.dart';
import 'package:lost_animal/widgets/app_bar.dart';

import '../../local_storage.dart';
import '../../services/LostForm_model.dart';
import '../../services/http_services.dart';

import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController username = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController mail = TextEditingController();

  final HttpService httpService = HttpService();

  // String userName = 'Nickname';
  // String phoneNumber = "1111";
  // String mail = "@gmail/com";

  @override
  void initState() {
    BlocProvider.of<PersonalInfoBloc>(context).add(PersonalInfoLoad());
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    phoneNumber.dispose();
    mail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: DesignConfig.size, allowFontScaling: true);
    return BlocBuilder<PersonalInfoBloc, PersonalInfoState>(
        builder: (context, state) {
          if (state is PersonalInfoLoaded) {
            this.username.text = state.username;
            this.phoneNumber.text = state.phoneNumber;
            this.mail.text = state.mail;
          }
          return personalInfo();
        });
  }

  Widget personalInfo() {
    return Scaffold(
      appBar: myAppBar("Profile", false),
      body: SafeArea(
        child: Container(
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 65.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 100.w, bottom: 10.h),
                      child:
                      Text(
                        'Username',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    infoFiled(this.username),
                    SizedBox(
                      height: 30.h,
                    ),

                    Padding(
                      padding: EdgeInsets.only(right: 130.w, bottom: 10.h),
                      child: Text(
                        'Phone',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    infoFiled(this.phoneNumber),
                    SizedBox(
                      height: 30.h,
                    ),

                    Padding(
                      padding: EdgeInsets.only(right: 130.w, bottom: 10.h),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    infoFiled(this.mail),
                    SizedBox(
                      height: 50.h,
                    ),
                    _logOutButton()
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget _logOutButton() {

    return Container(
      width: 200.0.w,
      height: 55.0.h,
      child: FloatingActionButton(
        heroTag: "login_button",
        backgroundColor: Color(0xFF000066),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(
          'Log out',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
        ),
        onPressed: () {
          BlocProvider.of<PersonalInfoBloc>(context).add(PersonalInfoLogOut());
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => StartScreen(),
            ),
                (route) => false,
          );
        },
      ),
    );
  }

  Widget infoFiled(valueController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 55,
          child: WillPopScope(
            child: Text(
              valueController.text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

