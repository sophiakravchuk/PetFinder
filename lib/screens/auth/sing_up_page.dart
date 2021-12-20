import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/blocs/authsingup_bloc/authsingup_event.dart';

import 'package:lost_animal/screens/personal_info/profile_screen.dart';
import 'package:lost_animal/blocs/authsingup_bloc/authsingup_bloc.dart';
import 'package:lost_animal/blocs/authsingup_bloc/authsingup_state.dart';
import 'package:lost_animal/widgets/tabsbar.dart';

import '../../constants.dart';

import '../../services/UserForm.dart';
import '../../services/http_services.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key key}) : super(key: key);

  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController username = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController mail = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confpass = TextEditingController();
  HttpService httpService = HttpService();

  @override
  void initState() {
    BlocProvider.of<AuthSingUpBloc>(context).add(AuthSingUpSave());
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    phoneNumber.dispose();
    mail.dispose();
    pass.dispose();
    confpass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: DesignConfig.size, allowFontScaling: true);
    return BlocBuilder<AuthSingUpBloc, AuthSingUpState>(
        builder: (context, state) {
          if (state is AuthSingUpSaved) {
          }
          return authSingUpPage();
        });
  }

  Widget authSingUpPage() {

    return Scaffold(
      appBar: myAppBar(),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ListView(
              children: [
                Column(
                  children: [
                    Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'User account registration form',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24.sp,
                      ),
                    ),
                  ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(35, 15, 0, 0),
                      child: Text(
                        'Please fill in fields, providing personal information asked bellow.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    inputField("Username", "Enter your Name or Nickname", TextInputType.text, false, username),

                    SizedBox(
                      height: 10.h,
                    ),
                    inputField("Phone", "(012)-345-67-89", TextInputType.phone, false, phoneNumber),
                    SizedBox(
                      height: 10.h,
                    ),
                    inputField("Email","example@mail.com", TextInputType.emailAddress, false, mail),
                    SizedBox(
                      height: 10.h,
                    ),
                    inputField("Password","Enter your password here", TextInputType.visiblePassword, true, pass),
                    inputField("Confirm password","Repeat password to confirm it", TextInputType.visiblePassword, true, confpass),
                    SizedBox(
                      height: 20.h,
                    ),
                    _singUpButton(),
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget inputField(String label, String hint, TextInputType inputType, bool obscureFlag, TextEditingController control) {
    return Container(
        width: 300.0.w,
        height: 65.0.h,
    child: TextField(
      controller: control,
      keyboardType: inputType,
      obscureText: obscureFlag,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
        labelText: label,
      ),
      onChanged: (String value) { return value; },
    ),
    );
  }



  Widget _singUpButton() {
    UserForm userForm = UserForm();
    return Container(
      width: 200.0.w,
      height: 55.0.h,
      child: FloatingActionButton(
        heroTag: "sign_up_button",
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(
          'Save & Sign up',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24.sp,
          ),
        ),
        onPressed: () {
          userForm.userName = username.text;
          userForm.email = mail.text;
          userForm.pass = pass.text;
          userForm.phone = phoneNumber.text;
          httpService.createUserForm(userForm);
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

