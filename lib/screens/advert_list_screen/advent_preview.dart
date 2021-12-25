import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lost_animal/blocs/advert_list_bloc/advert_list_bloc.dart';
import 'package:lost_animal/blocs/advert_list_bloc/advert_list_event.dart';
import 'package:lost_animal/screens/advert_screen/advert_screen.dart';
import 'package:lost_animal/services/LostForm_model.dart';
import 'package:lost_animal/services/http_services.dart';


class AdventPreview extends StatelessWidget {
  final LostForm advent;
  final bool my;

  const AdventPreview({Key key, @required this.advent, @required this.my})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpService httpService = HttpService();
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdvertScreen(
              authorName: advent.fullName,
              phoneNumber: advent.phone,
              mail: advent.email,
              animalType: advent.petType,
              animalName: advent.petName,
              description: advent.description,
              image: advent.image_bin,
            )));
      },
      child: Container(
        width: 367.w,
        padding: EdgeInsets.fromLTRB(27.w, 13.w, 13.w, 10.w),
        decoration: _decoration(),
        child: _content(context, httpService),
      ),
    );
  }

  Widget _content(BuildContext context, HttpService httpService) =>

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              adventPreviewImage(advent),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _title(),
                      SizedBox(width: 5.w),
                      _animalType(),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  _advertOwner(),
                ],
              ),
              // SizedBox(width: 20.w),

              if (my) ... [
                Spacer(),

                IconButton(

                  alignment: Alignment.topRight,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    BlocProvider.of<AdventListBloc>(context).add(AdventListDelete(id: advent.id));
                  },
                  padding: EdgeInsets.all(0.0),
                  iconSize: 30.sp,
                ),

              ]
            ],
          )
        ],
      );


  //TODO: test, idk if this works
  Widget adventPreviewImage(LostForm advent) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        // child: advent["imagePath"] == null
        child: (advent.image_bin == null || advent.image_bin == "") ?
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal, width: 1.5),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Image.asset('assets/images/default.png'),
        )
            : Image.memory(base64Decode(advent.image_bin),
          width: 80.w,
          height: 80.w,
          fit: BoxFit.cover, )

    );
  }


  Widget _title() =>
      Text(
        advent.petName,
        style: TextStyle(
          color: Colors.black,
          fontSize: 19.sp,
          fontWeight: FontWeight.w800,
          // fontFamily: nunito,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget _animalType() =>
      Text(
        advent.petType,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 14.sp,
          fontWeight: FontWeight.w800,
          // fontFamily: nunito,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Widget _advertOwner() =>
      Text(
        "author: " + advent.fullName,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 12.sp,
          fontWeight: FontWeight.w800,
          // fontFamily: nunito,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );

  Decoration _decoration() =>
      BoxDecoration(
        color: Color(0xFFC5D9EF),
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
}
