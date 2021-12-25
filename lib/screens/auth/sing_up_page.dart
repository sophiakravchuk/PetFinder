import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypt/crypt.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/blocs/authsingup_bloc/authsingup_event.dart';
import 'package:lost_animal/screens/auth/log_in_page.dart';

import 'package:lost_animal/screens/personal_info/profile_screen.dart';
import 'package:lost_animal/blocs/authsingup_bloc/authsingup_bloc.dart';
import 'package:lost_animal/blocs/authsingup_bloc/authsingup_state.dart';
import 'package:lost_animal/widgets/tabsbar.dart';
import 'package:lost_animal/widgets/app_bar.dart';

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
  final _formKey = GlobalKey<FormState>();
  bool userExist;

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
      appBar: myAppBar("PetFinder"),
      body: SafeArea(
          child:Form(
            key: _formKey,
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
                        inputField("Phone", "0671111111 | +380671111111", TextInputType.phone, false, phoneNumber),
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
          )),
    );
  }

  Widget inputField(String label, String hint, TextInputType inputType, bool obscureFlag, TextEditingController control) {
    return Container(
      width: 300.0.w,
      height: 65.0.h,
      child: TextFormField(
        controller: control,
        validator: (value) {
          if (control == this.username){
            if (value == null || value.isEmpty) {
              return 'Please enter your username';
            }
            else if (value.length < 3 || value.length > 21) {
              if (value.length < 3) {
                return 'Username too short (must be 3-20)';
              }
              else {
                return 'Username too long (must be 3-20)';
              }
            }
          }
          else if (control == this.phoneNumber) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number ';
            }
            else if (value.contains(RegExp(r'[A-Za-z]'))) {
              return 'Phone number must not contain letters';
            }
            else if (value.length < 10 || value.length > 14) {
              return 'Incorrect phone number';
            }
          }
          else if (control == this.mail) {
            RegExp regExp = new RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            if (value == null || value.isEmpty) {
              return 'Please enter your email address';
            }
            else if (!regExp.hasMatch(value)) {
              return 'Incorrect email';
            }
          }
          else if (control == this.pass) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            else if (value.length < 6 || value.length > 21) {
              if (value.length < 6) {
                return 'Too short password (must be 6-20)';
              }
              else {
                return 'Too long password (must be 6-20)';
              }
            }
          }
          else if (control == this.confpass) {
            if (value == null || value.isEmpty) {
              return 'Please repeat your password';
            }
            else if (this.confpass.text.isEmpty) {
              return 'Please enter password above';
            }
            else if (value != this.pass.text) {
              return 'Password and confirmation password do not match';
            }
          }
          return null;
        },
        keyboardType: inputType,
        obscureText: obscureFlag,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint,
          labelText: label,
        ),
        onChanged: (String inputValue) { return inputValue; },
      ),
    );
  }

  Future<bool> _userExist() async {
    List<UserForm> users = await httpService.getUserForms();
    for (int i = 0; i < users.length; i ++){
      if (users[i].email == mail.text){
        return true;
      }
    }
    return false;
  }

  Widget _singUpButton() {
    UserForm userForm = UserForm();
    return Container(
      width: 200.0.w,
      height: 55.0.h,
      child: ElevatedButton(
          onPressed: () async {
            // Validate returns true if the form is valid, or false otherwise.
            if (_formKey.currentState.validate()) {
              userExist = await _userExist();
              if (userExist) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('User with such email address already exists')),
                );
              }
              else {
                userForm.userName = username.text;
                userForm.email = mail.text;
                userForm.pass = Crypt.sha256(pass.text).toString();;
                userForm.phone = phoneNumber.text;
                httpService.createUserForm(userForm);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen())
                );
              }
            }
          },
          child: Text(
              'Save & Sign up',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp)
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF000066))
          )
      ),
    );
  }


}

