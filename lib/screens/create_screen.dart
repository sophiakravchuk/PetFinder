import 'package:flutter/material.dart';
import 'package:lost_animal/model/advert.dart';
import 'package:lost_animal/model/advert_preferences.dart';
import 'package:lost_animal/widgets/advert_widget.dart';
import 'package:lost_animal/widgets/text_field_widget.dart';

import 'package:path/path.dart';

class AdvertPage extends StatefulWidget {
  @override
  _AdvertPageState createState() => _AdvertPageState();
}

class _AdvertPageState extends State<AdvertPage> {
  Advert user = AdvertPreference.myAdvert;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Builder(
          builder: (context) => Scaffold(
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                AdvertWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: user.name,
                  onChanged: (name) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Phone number',
                  text: user.phone,
                  maxLines: 5,
                  onChanged: (phone) {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Description',
                  text: user.description,
                  maxLines: 5,
                  onChanged: (description) {},
                ),
              ],
            ),
          ),
        ),
      );
}
