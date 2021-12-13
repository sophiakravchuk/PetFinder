import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:lost_animal/blocs/advert/advert_bloc.dart';
import 'package:lost_animal/blocs/advert/advert_event.dart';
import 'package:lost_animal/blocs/advert/advert_state.dart';
import 'package:lost_animal/widgets/text_field_widget.dart';

import '../../constants.dart';

class AdvertCreationScreen extends StatefulWidget {
  const AdvertCreationScreen({Key key}) : super(key: key);

  @override
  _AdvertCreationScreenState createState() => _AdvertCreationScreenState();
}

class _AdvertCreationScreenState extends State<AdvertCreationScreen> {
  final TextEditingController fullname = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController mail = TextEditingController();
  // final TextEditingController animal = TextEditingController();
  final TextEditingController animalName = TextEditingController();
  final TextEditingController description = TextEditingController();
  String imagePath = '';

  String dropdownvalue = 'Dog';
  var items = ['Dog', 'Cat', 'Rabbit', 'Other'];

  @override
  void initState() {
    BlocProvider.of<AdvertBloc>(context).add(AdvertCreation());
    super.initState();
  }

  @override
  void dispose() {
    fullname.dispose();
    print(fullname);
    phoneNumber.dispose();
    mail.dispose();
    animalName.dispose();
    description.dispose();
    // imagePath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: DesignConfig.size, allowFontScaling: true);
    return BlocBuilder<AdvertBloc, AdvertState>(builder: (context, state) {
      if (state is AdvertCreated) {
        this.fullname.text = state.fullName;
        this.phoneNumber.text = state.phoneNumber;
        this.mail.text = state.mail;
        this.animalName.text = state.animalName;
        // this.animal.text = state.animal;
        this.description.text = state.description;
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
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    buildImage(),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: ClipOval(
                        child: Container(
                            color: Colors.blue,
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.white,
                              iconSize: 20,
                              onPressed: () {},
                            )),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full name',
                  controller: this.fullname,
                  onChanged: (fullname) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: this.mail.text,
                  onChanged: (mail) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Phone number',
                  text: this.phoneNumber.text,
                  controller: this.phoneNumber,
                  onChanged: (phoneNumber) {},
                ),
                const SizedBox(height: 24),
                Text(
                  "Animal",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                DropdownButton<String>(
                  value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownvalue = newValue;
                    });
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Animal name',
                  text: this.animalName.text,
                  onChanged: (animalName) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Description',
                  text: this.description.text,
                  maxLines: 5,
                  onChanged: (description) {},
                ),
                SizedBox(
                  height: 50,
                ),
                saveUserProfileButton(),
              ],
            )
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
    final image = NetworkImage(
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80');

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          // image: NetworkImage(this.imagePath),
          fit: BoxFit.cover,
          width: 128,
          height: 128,
        ),
      ),
    );
  }
}
