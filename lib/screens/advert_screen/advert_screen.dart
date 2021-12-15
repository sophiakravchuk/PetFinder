import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:lost_animal/blocs/advert/advert_bloc.dart';
import 'package:lost_animal/blocs/advert/advert_event.dart';
import 'package:lost_animal/blocs/advert/advert_state.dart';
import 'package:lost_animal/widgets/text_field_widget.dart';

import '../../constants.dart';

class AdvertScreen extends StatefulWidget {
  const AdvertScreen({Key key}) : super(key: key);

  @override
  _AdvertScreenState createState() => _AdvertScreenState();
}

class _AdvertScreenState extends State<AdvertScreen> {
  // String fullname = '';
  String phoneNumber;
  String mail;
  String animal;
  String animalName;
  String description;
  String imagePath = '';

  final TextEditingController fullname = TextEditingController();
  // final TextEditingController mail = TextEditingController();
  // // final TextEditingController animal = TextEditingController();
  // final TextEditingController animalName = TextEditingController();
  // final TextEditingController description = TextEditingController();
  // String imagePath = '';
  // var items = ['Dog', 'Cat', 'Rabbit', 'Other'];

  @override
  void initState() {
    BlocProvider.of<AdvertBloc>(context).add(AdvertLoad());
    super.initState();
  }

  @override
  void dispose() {
    fullname.dispose();
    print(fullname);
    // phoneNumber.dispose();
    // mail.dispose();
    // animalName.dispose();
    // description.dispose();
    // imagePath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: DesignConfig.size, allowFontScaling: true);
    return BlocBuilder<AdvertBloc, AdvertState>(builder: (context, state) {
      if (state is AdvertLoaded) {
        this.fullname.text = state.fullName;

        this.phoneNumber = state.phoneNumber;
        this.mail = state.mail;
        this.animalName = state.animalName;
        this.animal = state.animal;
        this.description = state.description;
        this.imagePath = state.imagePath;
      }
      return advertCreation();
    });
  }

  Widget advertCreation() {
    return Scaffold(
      appBar: myAppBar(),
      body: SafeArea(
        child: Container(
            child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                buildImage(),
                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 18, 0),
                  child: Text(
                    'Author name',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  this.fullname.text,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 18, 0),
                  child: Text(
                    'Phone number',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '48774784348',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 18, 0),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'sdss@sfvd.com',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 18, 0),
                  child: Text(
                    'Pet',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'cat',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 18, 0),
                  child: Text(
                    'Pet name',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Marsik',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 18, 0),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'we wdjw  k;dwekdnwekdwdwdaldjasld dvsdvsvsve wdjw  k;dwekdnwekdwdwdaldjasld',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ],
        )),
      ),
    );
  }

  Widget myAppBar() {
    return AppBar(
      title: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Text(
          'New Advert',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
      elevation: 0,
    );
  }

  Widget saveUserProfileButton() {
    return Container(
      width: 100.0,
      height: 35.0,
      child: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        onPressed: () {
          //  TODO
        },
      ),
    );
  }

  Widget buildImage() {
    return Container(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80'),
          fit: BoxFit.cover,
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
