import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lost_animal/blocs/pesonalInfo_bloc/personalInfo_bloc.dart';
import 'package:lost_animal/blocs/pesonalInfo_bloc/personalInfo_event.dart';
import 'package:lost_animal/blocs/pesonalInfo_bloc/personalInfo_state.dart';
import 'package:lost_animal/screens/advert_list_screen/advert_list_screen.dart';
import 'package:lost_animal/widgets/app_bar.dart';

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
      appBar: myAppBar("Profile"),
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

                    saveUserProfileButton(),
                  ],
                )
              ],
            )),
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
            child: TextField(
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
              controller: valueController,
              onSubmitted: (value) {
                valueController.text = value;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget saveUserProfileButton() {
    return Container(
      width: 100.0.w,
      height: 35.0.h,
      child: FloatingActionButton(
        heroTag: "save_user_button",
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
          ),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AdvertListScreen()));
        //  TODO
          LostForm lf = LostForm(
            userName: "j",
            id: 2,
            email: 'k',
            phone: "90",
          );
          // httpService.createLostForm(lf);
          List<LostForm> res = httpService.getLostForms() as List<LostForm>;
          print(res[0].toJson().toString());

        },
      ),
    );
  }


}

