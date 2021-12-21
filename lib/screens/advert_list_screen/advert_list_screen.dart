import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lost_animal/blocs/advert_list_bloc/advert_list_bloc.dart';
import 'package:lost_animal/blocs/advert_list_bloc/advert_list_event.dart';
import 'package:lost_animal/blocs/advert_list_bloc/advert_list_state.dart';
import 'package:lost_animal/screens/advert_list_screen/advent_preview.dart';
import 'package:lost_animal/widgets/app_bar.dart';

import '../../constants.dart';

class AdvertListScreen extends StatefulWidget {
  AdvertListScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AdvertListScreenState();
}

class _AdvertListScreenState extends State<AdvertListScreen> {
  List<Map> adventList = [];
  bool myCheckboxValue = false;

  @override
  void initState() {
    BlocProvider.of<AdventListBloc>(context).add(AdventListLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: DesignConfig.size, allowFontScaling: true);
    return BlocBuilder<AdventListBloc, AdventListState>(
        builder: (context, state) {
          if (state is AdventListLoaded) {
            this.adventList = state.adventList;
          }
          return body();
        });
  }

  body() {
    return Scaffold(
      appBar: myAppBar("Advent List"),
      body: SafeArea(
        child: Container(
            child: advertList()),
      // child: _checkbox()),
      ),
    );
  }

  Widget advertList() {
      if (this.adventList.isNotEmpty) {
           return advertListWidget(
                this.adventList,
              );
        } else {
         return Center(child: loadingCircle());
        }
  }

  Widget advertListWidget(List<Map> list) {
    return Column(
        children: <Widget>[
          _checkbox(),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(23.5.w, 0, 23.5.w, 30.w),
              itemCount: list.length,
              itemBuilder: (context, index) {
                if (list != null && list.length > 0) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      AdventPreview(
                        advent: list[index],
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
              separatorBuilder: (context, index) => SizedBox(height: 1.w),
            ),
          )
        ]
    );
  }


  Widget loadingCircle() {
    Widget indicator = CupertinoActivityIndicator();
    return indicator;
  }

  Widget _checkbox() {
    return FlatButton(
      onPressed: () {
        setState(() {
          myCheckboxValue = !myCheckboxValue;
        });
      },
      child:
      Padding(
        padding: EdgeInsets.fromLTRB(27.w, 13.w, 13.w, 10.w),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'My only ',
                style: TextStyle(
                  color: Colors.black,
                  // fontFamily: openSans,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
              Icon(
                  myCheckboxValue
                      ? Icons.check_box
                      : Icons.check_box_outline_blank,
                  size: 26.w,
                  color: Colors.green)
            ]),
      ),
    );
  }
}
