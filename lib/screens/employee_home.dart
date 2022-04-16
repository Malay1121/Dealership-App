import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/screens/employee_data.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/home_page.dart';
import 'package:dealership/screens/options.dart';
import 'package:dealership/screens/profile_pic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidebarx/sidebarx.dart';

var profileComplete;

class EmployeeHome extends StatefulWidget {
  const EmployeeHome({Key? key}) : super(key: key);

  @override
  State<EmployeeHome> createState() => _EmployeeHomeState();
}

class _EmployeeHomeState extends State<EmployeeHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    getAllData(login);
    checkProfile();
  }

  checkProfile() async {
    var _sharedPreferences = await SharedPreferences.getInstance();
    await FirebaseFirestore.instance
        .collection('users')
        .where(
          'uid',
          isEqualTo: _sharedPreferences.getString('uid'),
        )
        .get()
        .then(
      (value) async {
        setState(() {
          pfp = value.docs[0]['image'];
        });
        if (await value.docs[0]['fullName'] == '') {
          setState(() {
            profileComplete = false;
          });
        } else {
          setState(() {
            profileComplete = true;
          });
        }
      },
    );
  }

  final _controller = SidebarXController(selectedIndex: 0);

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: profileComplete == true
            ? FloatingActionButton(
                elevation: 0,
                onPressed: () async {
                  var _sharedPreferences =
                      await SharedPreferences.getInstance();
                  print(_sharedPreferences.getString('username'));
                  print(_sharedPreferences.getString('password'));
                  print(_sharedPreferences.getString('uid'));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OptionScreen()));
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(Icons.add),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF3C8CE7),
                        Color(0xFF00EAFF),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              )
            : SizedBox(),
        key: _scaffoldKey,
        drawer: SizedBox(
          width: _mediaQuery.width / 1.74647887324,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.only(
                    bottom: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: _mediaQuery.width / 20.6666666667,
                          top: _mediaQuery.height / 31.2307692308,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: _mediaQuery.height / 20.2307692308,
                            width: _mediaQuery.width / 9.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'assets/menu_black.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _mediaQuery.height / 36.2765957447,
                      ),
                      ListTile(
                        leading: pfp == null
                            ? CircleAvatar(
                                backgroundColor: blue,
                                radius: _mediaQuery.width / 24.8,
                                child: CircleAvatar(
                                    backgroundColor: Color(0xFFE6F1F9),
                                    radius: _mediaQuery.width / 26.5714285714,
                                    child: Icon(Icons.person_outline)),
                              )
                            : CircleAvatar(
                                backgroundColor: blue,
                                radius: _mediaQuery.width / 24.8,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFFE6F1F9),
                                  radius: _mediaQuery.width / 26.5714285714,
                                  backgroundImage: NetworkImage(pfp),
                                ),
                              ),
                        title: Text(
                          '$name',
                          style: TextStyle(
                            color: blue,
                            fontFamily: roboto,
                            fontWeight: FontWeight.w700,
                            fontSize: _mediaQuery.width / 24.8,
                          ),
                        ),
                        subtitle: Text(
                          '$phone',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            fontFamily: roboto,
                            fontWeight: FontWeight.w700,
                            fontSize: _mediaQuery.width / 37.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                NavItems(
                  mediaQuery: _mediaQuery,
                  text: 'Fixed Assets',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeData(
                          list: <String>[
                            'registerationNumber',
                            'makeAndModel',
                            'dateOfBuying',
                            'customerName',
                            'location',
                            'location',
                            'remarkIfNo',
                          ],
                          collection: 'cars',
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: _mediaQuery.height / 81.2,
                ),
                NavItems(
                    mediaQuery: _mediaQuery,
                    text: 'Log Out',
                    onTap: () async {
                      var _sharedPreferences =
                          await SharedPreferences.getInstance();
                      _sharedPreferences.setString('username', '');
                      _sharedPreferences.setString('password', '');
                      _sharedPreferences.setString('uid', '');
                      _sharedPreferences.setString('phone', '');
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GetStarted()));
                    }),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: _mediaQuery.height / 2.96350364964,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF3C8CE7),
                    Color(0xFF00EAFF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(39),
                  bottomRight: Radius.circular(39),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: _mediaQuery.width / 20.6666666667,
                      top: _mediaQuery.height / 31.2307692308,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Container(
                        height: _mediaQuery.height / 20.2307692308,
                        width: _mediaQuery.width / 9.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/menu_white.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      right: _mediaQuery.width / 20.6666666667,
                      top: _mediaQuery.height / 31.2307692308,
                    ),
                    child: Text(
                      'Hi, $name',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: roboto,
                        fontSize: _mediaQuery.width / 14.88,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: profileComplete == true
                  ? _mediaQuery.height / 4.83333333333
                  : _mediaQuery.height / 6.15151515152,
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    width: profileComplete == true
                        ? _mediaQuery.width / 1.5306122449
                        : _mediaQuery.width / 1.13293051,
                    child: GestureDetector(
                      onTap: () async {
                        var _sharedPreferences =
                            await SharedPreferences.getInstance();
                        print(_sharedPreferences.getString('username'));
                        print(_sharedPreferences.getString('password'));
                        print(_sharedPreferences.getString('phone'));
                        print(_sharedPreferences.getString('uid'));
                      },
                      child: profileComplete == true
                          ? Text(
                              'Please Tap on “+” to get started',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontFamily: roboto,
                                fontSize: _mediaQuery.width / 14.4230769,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              'Please complete your profile to get started',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontFamily: roboto,
                                fontSize: _mediaQuery.width / 14.4230769,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                  profileComplete == true
                      ? SizedBox()
                      : Column(
                          children: [
                            SizedBox(
                              height: _mediaQuery.height / 15.037037037,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: _mediaQuery.width / 7.8125,
                                right: _mediaQuery.width / 7.8125,
                              ),
                              child: Button2(
                                mediaQuery: _mediaQuery,
                                fill: false,
                                title: 'Complete Profile',
                                nextScreen: ProfilePic(),
                              ),
                            )
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
