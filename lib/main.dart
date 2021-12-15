import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/screens/advert_list_screen/advert_list_screen.dart';
import 'package:lost_animal/screens/personal_info/profile_screen.dart';
import 'package:lost_animal/widgets/tabsbar.dart';
import 'package:lost_animal/screens/auth/starting_page.dart';
import 'blocs/advert/advert_bloc.dart';
import 'blocs/advert/advert_state.dart';
import 'blocs/advert_list_bloc/advert_list_bloc.dart';
import 'blocs/pesonalInfo_bloc/personalInfo_bloc.dart';
import 'blocs/authsingup_bloc/authsingup_bloc.dart';
import 'blocs/authlogin_bloc/authlogin_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    // MultiRepositoryProvider(
    // providers: [
    //   // RepositoryProvider<UserInfoRepository>(),
    // ],
    // child:
    MultiBlocProvider(
      providers: [
        BlocProvider<PersonalInfoBloc>(create: (context) => PersonalInfoBloc()),
        BlocProvider<AdvertBloc>(create: (context) => AdvertBloc()),
        BlocProvider<AuthSingUpBloc>(create: (context) => AuthSingUpBloc()),
        BlocProvider<AuthLogInBloc>(create: (context) => AuthLogInBloc()),
        BlocProvider<AdventListBloc>(create: (context) => AdventListBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: StartScreen(),
        debugShowCheckedModeBanner: false,
      ),
      // ),
    );
  }
}
