import 'package:dealership/constants.dart';
import 'package:dealership/screens/employee_data.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dealership/screens/options.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // getAllData(login);
    // Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          onPressed: () {
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
        ),
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
                        leading: CircleAvatar(
                          backgroundColor: blue,
                          radius: _mediaQuery.width / 24.8,
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFE6F1F9),
                            radius: _mediaQuery.width / 26.5714285714,
                            child: Icon(Icons.person_outline),
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
                NavItems(
                  mediaQuery: _mediaQuery,
                  text: 'Employee Details',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmployeData(
                          list: <String>[
                            'name',
                            'dateOfJoining',
                            'department',
                            'fullName',
                            'location',
                            'password',
                            'phone',
                            'role',
                            'salary',
                            'uid',
                            'aadharCardNumber',
                            'panNumber',
                          ],
                          collection: 'users',
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
                    Navigator.pop(context);
                    storage.write(key: 'username', value: '');
                    storage.write(key: 'password', value: '');
                    storage.write(key: 'uid', value: '');
                    storage.write(key: 'phone', value: '');
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => GetStarted()));
                  },
                ),
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
              height: _mediaQuery.height / 20.3,
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Options(
                          mediaQuery: _mediaQuery,
                          title: 'Call Reports',
                          subtitle:
                              'Here you can check all details regarding callings.',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmployeData(
                                  list: <String>[
                                    'callDone',
                                    'callDone2',
                                    'callingDepartment',
                                    'callingData',
                                    'consultant',
                                    'customerName',
                                    'location',
                                    'dealerName',
                                    'evaluationDoneNotBuying',
                                    'evaluationDoneNotBuying2',
                                    'evaluator',
                                    'newCarModel',
                                    'otherRemarkFromEvaluator',
                                    'remarkFromEvaluator',
                                    'remarkIfNo',
                                    'remarkNotBuying',
                                    'teamLeader',
                                    'typeOfCustomer',
                                    'typeOfCustomer2',
                                    'uid',
                                  ],
                                  collection: 'Calling Analysis',
                                ),
                              ),
                            );
                          }),
                      Options(
                        mediaQuery: _mediaQuery,
                        title: 'Buyings',
                        subtitle:
                            'Here you can check all details regaring callings.',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeData(
                                collection: 'buying',
                                list: [
                                  'dealershipName',
                                  'location',
                                  'dateOfEnquiry',
                                  'customerName',
                                  'phone',
                                  'address',
                                  'enquirySource',
                                  'consultant',
                                  'teamLeader',
                                  'evaluator',
                                  'dateOfEvaluation',
                                  'registerationNumber',
                                  'makeAndModel',
                                  'chassisNumber',
                                  'engineNumber',
                                  'manufactureYear',
                                  'color',
                                  'kmDriven',
                                  'ownerSRNumber',
                                  'conditionNote',
                                  'insuranceDetail',
                                  'midnight',
                                  'conditionOfCar',
                                  'offerPrice',
                                  'expectedOfferPrice',
                                  'evaluationDone',
                                  'interestedInExchange',
                                  'exchangeDealClosed',
                                  'dateOfBuying',
                                  'typeOfBuying',
                                  'subTypeOfBuying',
                                  'reasonOfBuying',
                                  'bonusFacility',
                                  'bonusAmount',
                                  'allDocumentsAreClear',
                                  'anyHypBankName',
                                  'nocAvailability',
                                  'dealingType',
                                  'priceIncreaseForClosing',
                                  'reasonOfIncreaseAmount',
                                  'buyingDetailsAsPerRC',
                                  'bloodRelationAvailable',
                                  'buyingDoneWithERP',
                                  'buyingPrice',
                                  'seller',
                                  'uniqueId',
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Options(
                        mediaQuery: _mediaQuery,
                        title: 'Employees',
                        subtitle:
                            'Here you can check all details regaring callings.',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeData(
                                list: <String>[
                                  'name',
                                  'dateOfJoining',
                                  'department',
                                  'fullName',
                                  'image',
                                  'location',
                                  'password',
                                  'phone',
                                  'role',
                                  'salary',
                                  'uid'
                                ],
                                collection: 'users',
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Options(
                        mediaQuery: _mediaQuery,
                        title: 'Stocks',
                        subtitle:
                            'Here you can check all details regaring callings.',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EmployeData(
                                list: <String>[
                                  'registerationNumber',
                                  'color',
                                  'kmDriven',
                                ],
                                collection: 'stock',
                              ),
                            ),
                          );
                        },
                      ),
                      Options(
                        mediaQuery: _mediaQuery,
                        title: 'Sellings',
                        subtitle:
                            'Here you can check all details regaring callings.',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EmployeData(
                                  collection: 'selling',
                                  list: [
                                    'dealershipName',
                                    'location',
                                    'dateOfEnquiry',
                                    'customerName',
                                    'phone',
                                    'address',
                                    'enquirySource',
                                    'consultant',
                                    'teamLeader',
                                    'evaluator',
                                    'dateOfEvaluation',
                                    'registerationNumber',
                                    'makeAndModel',
                                    'chassisNumber',
                                    'engineNumber',
                                    'manufactureYear',
                                    'color',
                                    'kmDriven',
                                    'ownerSRNumber',
                                    'conditionNote',
                                    'insuranceDetail',
                                    'midnight',
                                    'conditionOfCar',
                                    'offerPrice',
                                    'expectedOfferPrice',
                                    'evaluationDone',
                                    'interestedInExchange',
                                    'exchangeDealClosed',
                                    'dateOfBuying',
                                    'typeOfBuying',
                                    'subTypeOfBuying',
                                    'reasonOfBuying',
                                    'bonusFacility',
                                    'bonusAmount',
                                    'allDocumentsAreClear',
                                    'anyHypBankName',
                                    'nocAvailability',
                                    'dealingType',
                                    'priceIncreaseForClosing',
                                    'reasonOfIncreaseAmount',
                                    'buyingDetailsAsPerRC',
                                    'bloodRelationAvailable',
                                    'buyingDoneWithERP',
                                    'buyingPrice',
                                    'seller',
                                    'uniqueId',
                                  ],
                                ),
                              ));
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required Size mediaQuery,
    required this.title,
    required this.subtitle,
    this.backgroundColor =
        const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
    this.titleColor = const Color(0xFF0177C1),
    this.subTitleColor = const Color(0xFF000000),
    this.border = true,
    this.onTap,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String title;
  final String subtitle;
  final LinearGradient backgroundColor;
  final Color titleColor;
  final Color subTitleColor;
  final bool border;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: _mediaQuery.width / 2.48066150974,
            height: _mediaQuery.height / 7.83405692233,
            decoration: BoxDecoration(
              gradient: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: border == true ? 1 : 0,
                color: blue,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: _mediaQuery.width / 3.12605042017,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: titleColor,
                      fontFamily: roboto,
                      fontSize: _mediaQuery.width / 18.6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: _mediaQuery.width / 3.12605042017,
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: subTitleColor == Color(0xFF000000)
                          ? Color(0xFF000000).withOpacity(0.6)
                          : subTitleColor,
                      fontFamily: roboto,
                      fontSize: _mediaQuery.width / 37.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _mediaQuery.height / 41.9638242894,
          ),
        ],
      ),
    );
  }
}

class NavItems extends StatelessWidget {
  const NavItems({
    Key? key,
    required Size mediaQuery,
    required this.text,
    required this.onTap,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: _mediaQuery.height / 35.333333333,
          left: _mediaQuery.width / 20.6666666667),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: blue,
            fontFamily: roboto,
            fontWeight: FontWeight.w700,
            fontSize: _mediaQuery.width / 24.8,
          ),
        ),
      ),
    );
  }
}
