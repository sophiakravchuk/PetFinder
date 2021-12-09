import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_animal/screens/personal_info/profile_screen.dart';
import 'package:lost_animal/widgets/tabsbar.dart';

import 'blocs/advert/advert_bloc.dart';
import 'blocs/advert/advert_state.dart';
import 'blocs/pesonalInfo_bloc/personalInfo_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonalInfoBloc>(create: (context) => PersonalInfoBloc()),
        BlocProvider<AdvertBloc>(create: (context) => AdvertBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TabsBarScreen(),
        debugShowCheckedModeBanner: false,
      ),
      // ),
    );
  }
}
