import 'dart:io';

import 'package:dealership/constants.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/profile_details1.dart';
import 'package:dealership/screens/profile_details2.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

FirebaseStorage storage = FirebaseStorage.instance;
var imageURL;

class _ProfilePicState extends State<ProfilePic> {
  File? image;

  _getFromGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Faild to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: _mediaQuery.height,
              width: _mediaQuery.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background.png'),
                ),
              ),
            ),
            Positioned(
              top: _mediaQuery.height / 3.90384615385,
              left: _mediaQuery.width / 12.5,
              right: _mediaQuery.width / 12.5,
              child: Container(
                height: _mediaQuery.height / 2.21666666667,
                width: _mediaQuery.width / 1.19047619048,
                decoration: BoxDecoration(
                  color: Color(
                    0xFFFBFBFB,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.highlight_off,
                            color: blue,
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              _getFromGallery();
                              var _sharedPreferences =
                                  await SharedPreferences.getInstance();
                            },
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  width: _mediaQuery.height / 5.92700729927,
                                  height: _mediaQuery.height / 5.92700729927,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      _mediaQuery.height / 12.0296296296,
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.fitHeight,
                                      image: image != null
                                          ? FileImage(image!) as ImageProvider
                                          : AssetImage(
                                              'assets/profile_pic.png'),
                                    ),
                                    color: Color(0xFFFCC010),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_circle_up,
                                  size: _mediaQuery.width / 11.71875,
                                  color: Color(0xFF2A5F8199).withOpacity(0.6),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Upload Profile Picture',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontFamily: roboto,
                              fontSize: _mediaQuery.width / 17.0454545455,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: _mediaQuery.width / 1.74418604651,
                            child: Text(
                              'Tap to select and upload a profile picture of yours.',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontFamily: roboto,
                                fontSize: _mediaQuery.width / 28.8461538462,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: _mediaQuery.height / 32.8461538462,
                          ),
                          Button(
                            mediaQuery: _mediaQuery,
                            text: 'Upload',
                            fillColor: Colors.white,
                            textColor: blue,
                            onTapCheck: true,
                            onTap: () async {
                              var _sharedPreferences =
                                  await SharedPreferences.getInstance();

                              var ref =
                                  await FirebaseStorage.instance.ref().child(
                                        _sharedPreferences
                                            .getString('uid')
                                            .toString(),
                                      );
                              ref.putFile(image!);

                              String url =
                                  (await ref.getDownloadURL()).toString();
                              imageURL = url;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileDetails1()));
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
