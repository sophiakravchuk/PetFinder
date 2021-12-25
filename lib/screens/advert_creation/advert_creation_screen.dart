import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_animal/blocs/advert/advert_bloc.dart';
import 'package:lost_animal/blocs/advert/advert_event.dart';
import 'package:lost_animal/blocs/advert/advert_state.dart';
import 'package:lost_animal/screens/advert_list_screen/advert_list_screen.dart';
import 'package:lost_animal/screens/advert_screen/advert_screen.dart';
import 'package:lost_animal/services/LostForm_model.dart';
import 'package:lost_animal/services/http_services.dart';
import 'package:lost_animal/widgets/app_bar.dart';
import 'package:lost_animal/widgets/text_field_widget.dart';

import '../../constants.dart';

class AdvertCreationScreen extends StatefulWidget {
  const AdvertCreationScreen({Key key}) : super(key: key);

  @override
  _AdvertCreationScreenState createState() => _AdvertCreationScreenState();
}

class _AdvertCreationScreenState extends State<AdvertCreationScreen> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController mail = TextEditingController();
  final TextEditingController petName = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController userId = TextEditingController();


  HttpService httpService = HttpService();

  File _image;
  String base64Image;


  String dropdownAnimalType = 'Dog';
  List<String> animalTypes = ['Dog', 'Cat', 'Rabbit', 'Other'];

  String dropdownAdvertType = 'Lost';
  List<String> advertTypes = ['Lost', 'Found'];

  @override
  void initState() {
    BlocProvider.of<AdvertBloc>(context).add(AdvertCreation());
    super.initState();
  }

  @override
  void dispose() {
    fullName.dispose();
    phoneNumber.dispose();
    mail.dispose();
    petName.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: DesignConfig.size, allowFontScaling: true);
    return BlocBuilder<AdvertBloc, AdvertState>(builder: (context, state) {
      if (state is AdvertCreated) {
        // this.fullName.text = state.fullName;
        this.phoneNumber.text = state.phoneNumber;
        this.mail.text = state.mail;
        this.petName.text = state.animalName;
        this.description.text = state.description;
        this.userId.text = state.userId.toString();
      }
      return advertCreation();
    });
  }

  Widget advertCreation() {
    return Scaffold(
      appBar: myAppBar("New Advert"),
      body: SafeArea(
        child: Container(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  icon: Icon(Icons.camera_alt),
                                  color: Colors.white,
                                  iconSize: 20,
                                  onPressed: () {
                                    _showPicker(context);
                                  },
                                )),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Full name',
                      controller: this.fullName,
                      onChanged: (fullname) {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Email',
                      controller: this.mail,
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
                      "Pet",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),

                    DropdownButton<String>(
                      value: dropdownAnimalType,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: animalTypes.map((String items) {
                        return DropdownMenuItem(value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownAnimalType = newValue;
                        });
                      },
                    ),

                    const SizedBox(height: 24),
                    Text(
                      "Advert Type",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),

                    DropdownButton<String>(
                      value: dropdownAdvertType,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: advertTypes.map((String items) {
                        return DropdownMenuItem(value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownAdvertType = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Pet name',
                      controller: this.petName,
                      onChanged: (petName) {},
                    ),
                    const SizedBox(height: 24),
                    TextFieldWidget(
                      label: 'Description',
                      controller: this.description,
                      maxLines: 5,
                      onChanged: (description) {},
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    saveAdvertButton(),
                    const SizedBox(height: 24)
                  ],
                )
              ],
            )),
      ),
    );
  }



  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }



  Widget buildImage(){
    return GestureDetector(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.grey[200]),
        child: _image != null
            ? Image.file(
          _image,
          width: 100.0,
          height: 100.0,
          fit: BoxFit.fitHeight,
        )
            : Container(
          decoration: BoxDecoration(
              color: Colors.grey[200]),
          width: 100,
          height: 100,
          child: Icon(
            Icons.camera_alt,
            color: Colors.grey[800],
          ),
        ),
      ),
    );
  }


  _imgFromCamera() async {
    File image = (await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    ));
    setState(() {
      this._image = image;
    });
  }


  _imgFromGallery() async {
    File image = (await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    ));
    setState(() {
      this._image = image;
    });
  }


  Widget saveAdvertButton() {
    LostForm lostForm = LostForm();
    return Center(
        child:
        Container(
        width: 100.0,
        height: 35.0,
        child:
        FloatingActionButton(
        heroTag: "save_profile_button",
        backgroundColor: Color(0xFF000066),
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
          lostForm.fullName = fullName.text;
          lostForm.petType = dropdownAnimalType;
          lostForm.advertType = dropdownAdvertType;
          lostForm.petName = petName.text;
          lostForm.description = description.text;
          lostForm.email = mail.text;
          lostForm.phone = phoneNumber.text;
          lostForm.userId = int.parse(userId.text);

          if(this._image != null){
            List<int> imageBytes = this._image.readAsBytesSync();
            this.base64Image = base64Encode(imageBytes);
            lostForm.image_bin = this.base64Image;
          } else {
            lostForm.image_bin = '';
          }


          httpService.createLostForm(lostForm);

          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdvertListScreen())
          );
        },
      ),
    ));
  }


}
