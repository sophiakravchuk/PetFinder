import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:lost_animal/blocs/advert/advert_bloc.dart';
import 'package:lost_animal/blocs/advert/advert_event.dart';
import 'package:lost_animal/blocs/advert/advert_state.dart';
import 'package:lost_animal/widgets/text_field_widget.dart';
import 'package:lost_animal/widgets/app_bar.dart';

import '../../constants.dart';

class AdvertScreen extends StatefulWidget {
  final String authorName;
  final String phoneNumber;
  final String mail;
  final String animalType;
  final String animalName;
  final String description;
  final String image;


  const AdvertScreen({Key key, @required this.authorName, @required this.phoneNumber,
                      @required this.mail, @required this.animalType,
                      @required this.animalName, @required this.description, @required this.image}) : super(key: key);

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
  String image;

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
        this.image = state.image;
      }
      return advertCreation();
    });
  }

  Widget advertCreation() {
    return Scaffold(
      appBar: myAppBar( 'Advert', true),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: buildImage(),
                ),
                const SizedBox(height: 24),
                infoContainerPet(),
                const SizedBox(height: 24),
                infoContainerUser(),
              ],
            ),
          ],
        )),
      ),
    );
  }

  Widget infoContainerUser() {
    return Container(
      width: 320.w,
      padding: EdgeInsets.fromLTRB(27.w, 13.w, 13.w, 10.w),
      decoration: _decoration(Color(0xFFC5D9EF)),
      child:       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Text(
                'Author name',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.authorName,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Phone number',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.phoneNumber,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Email',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.mail,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
        ],
      ),
    );
  }

  Widget infoContainerPet() {
    return Container(
      width: 320.w,
      padding: EdgeInsets.fromLTRB(27.w, 13.w, 13.w, 10.w),
      decoration: _decoration(Color(0x88000066)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
              Text(
                'Pet',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.animalType,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Pet name',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.animalName,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Description',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.description,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
      ),
    );
  }

  Decoration _decoration(Color color) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      );

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
            child: (widget.image == "" || widget.image == null) ?
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.teal, width: 1.5),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset('assets/images/default.png'),
            )
                : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.memory(base64Decode(widget.image),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                )
            )

        )

    );
  }
}
