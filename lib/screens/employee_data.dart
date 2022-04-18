import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dealership/constants.dart';
import 'package:dealership/screens/get_started.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

class EmployeData extends StatefulWidget {
  EmployeData({required this.collection, required this.list});

  final String collection;
  final List<String> list;

  @override
  State<EmployeData> createState() => _EmployeDataState();
}

var text;
List<List<String>> employeeList = [];
final db = FirebaseFirestore.instance;

class _EmployeDataState extends State<EmployeData> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    employeeList = [widget.list];
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
              top: _mediaQuery.height / 20, left: _mediaQuery.width / 30),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: widget.collection == 'users'
                    ? db
                        .collection('users')
                        .where('employee', isEqualTo: true)
                        .snapshots()
                    : widget.collection == 'buying'
                        ? db
                            .collection('cars')
                            .where('sell', isEqualTo: false)
                            .snapshots()
                        : widget.collection == 'selling'
                            ? db
                                .collection('cars')
                                .where('sell', isEqualTo: true)
                                .snapshots()
                            : widget.collection == 'stock'
                                ? db
                                    .collection('cars')
                                    .where('sell', isEqualTo: false)
                                    .snapshots()
                                : db.collection(widget.collection).snapshots(),
                builder: (context, snapshots) {
                  if (!snapshots.hasData) {
                    return Text('loading...');
                  } else {
                    return SizedBox(
                      height: _mediaQuery.height / 1.4,
                      width: _mediaQuery.width,
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          DocumentSnapshot doc = snapshots.data!.docs[index];

                          employeeList.add(
                            <String>[
                              for (var itm in employeeList.first) doc.get(itm),
                            ],
                          );
                          return DataTable2(
                            headingRowHeight: _mediaQuery.height / 17,
                            headingTextStyle: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            columnSpacing: 1,
                            horizontalMargin: 12,
                            minWidth: _mediaQuery.width*(employeeList.first.length>11?(employeeList.first.length) * 0.45:(employeeList.first.length) * 0.37),
                            columns: [
                              for (var item in employeeList.first)
                                DataColumn2(
                                  label: Text(item.toUpperCase()),
                                  size: ColumnSize.L,
                                ),
                            ],
                            rows: List<DataRow>.generate(
                              snapshots.data!.docs.length,
                              (index1) {
                                var docsKeys = (snapshots.data!.docs[index1]
                                        .data() as Map<String, dynamic>)
                                    .keys;
                                return DataRow(
                                  cells: [
                                    for (var item in employeeList.first)
                                      DataCell(
                                        Text(
                                          !docsKeys.contains(item)
                                              ? "None"
                                              : snapshots.data!.docs[index1]
                                                  .get(item)
                                                  .toString(),
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
              GestureDetector(
                onTap: () async {
                  await saveFile();
                  print(employeeList);
                },
                child: Container(
                  height: _mediaQuery.height / 18,
                  width: _mediaQuery.width / 1.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: blue,
                  ),
                  child: Center(
                    child: Text(
                      'Export as CSV',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: _mediaQuery.width / 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool loading = false;

  Future<bool> saveFile() async {
    Directory? directory;
    final Dio dio = Dio();
    String csvData = ListToCsvConverter().convert(employeeList);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat("MM-dd-yyyy-HH-mm-ss").format(now);

    if (Platform.isAndroid) {
      if (await _requestPermission(Permission.storage) &&
          await _requestPermission(Permission.manageExternalStorage)) {
        directory = await getExternalStorageDirectory();
        String newPath = '';
        List<String> folders = directory!.path.split('/');
        for (int x = 1; x < folders.length; x++) {
          String folder = folders[x];
          if (folder != 'Android') {
            newPath += '/' + folder;
          } else {
            break;
          }
        }
        newPath = newPath + '/CSVexports';
        directory = Directory(newPath);
        print(directory.path);
      } else {
        return false;
      }
    } else {
      if (await _requestPermission(Permission.photos)) {
        directory = await getTemporaryDirectory();
      } else {
        return false;
      }
    }
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    if (await directory.exists()) {
      final File file =
          await (File(directory.path + '/employee_export_$formattedDate.csv'))
              .create();

      await file.writeAsString(csvData).then((value) => showSnackBar(
          context,
          'Find your export at ${directory!.path}' +
              '/employee_export_$formattedDate.csv'));
    }
    return false;
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == permission.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
