import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// // "fullName": "Julia Pochynok",
// // "phoneNumber": "111111111",
// // "mail": "julia@gmail.com",
// // "animal": "bunny",
// // "animalName": "Umu",
// "description": "Really cool bunny",
// "imagePath": null,

class AdventPreview extends StatelessWidget {
  final Map advent;

  const AdventPreview({Key key, @required this.advent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  TODO: add navigation
        print("on preview");
      },
      child: Container(
        width: 367.w,
        padding: EdgeInsets.fromLTRB(27.w, 13.w, 13.w, 10.w),
        decoration: _decoration(),
        child: _content(context),
      ),
    );
  }

  Widget _content(BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(width: 20.w),
            ],
          )
        ],
      );


  //TODO: test, idk if this works
  Widget adventPreviewImage(Map advent) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: advent["imagePath"] == null
          ? Container(
        width: 80.w,
        height: 80.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.teal, width: 1.5),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Image.asset('assets/images/default.png'),
      )
          : Image.network(
        advent["imagePath"],
        width: 80.w,
        height: 80.w,
        fit: BoxFit.cover,
      ),
    );
  }


  Widget _title() =>
      Text(
        advent["animalName"],
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
        advent["animal"],
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
        "author: " + advent["fullName"],
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
        color: Colors.green.shade50,
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
