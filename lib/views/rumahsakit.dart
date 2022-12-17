import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../views/theme.dart';

class Rumahsakit extends StatefulWidget {
  const Rumahsakit({Key? key}) : super(key: key);

  @override
  State<Rumahsakit> createState() => _RumahsakitState();
}

class _RumahsakitState extends State<Rumahsakit> {
  int listC = 0;
  var sessions = [];

  var pincode = "";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    print(pincode);
    getData();
    super.initState();
  }

  getData() async {
    var url = Uri.parse('https://dekontaminasi.com/api/id/covid19/hospitals');
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    print(result);
    setState(() {
      sessions = result;
      listC = sessions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11249F),
        title: const Text("Results"),
      ),
      body: Container(
          margin: EdgeInsets.only(
            top: 20.0,
          ),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: listC,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: defaultMargin,
                    top: 5.0,
                    right: defaultMargin,
                    bottom: defaultMargin,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                      bottom: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                        bottom: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF3383CD),
                          Color(0xFF11249F),
                        ],
                      ),
                      image: DecorationImage(
                        image: AssetImage("assets/images/virus.png"),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: defaultMargin,
                            right: defaultMargin,
                            top: 20.0,
                            bottom: 20.0,
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                Text(sessions[index]['name'],
                                    style: blackTextStyle.copyWith(
                                        fontWeight: bold,
                                        fontSize: 11.0,
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                SizedBox(height: 20),
                                Text(sessions[index]['region'],
                                    style: blackTextStyle.copyWith(
                                        fontWeight: bold,
                                        fontSize: 10.0,
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                SizedBox(height: 20),
                                Text(sessions[index]['phone'].toString(),
                                    style: blackTextStyle.copyWith(
                                        fontWeight: bold,
                                        fontSize: 10.0,
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                                SizedBox(height: 20),
                                Text(sessions[index]['province'].toString(),
                                    style: blackTextStyle.copyWith(
                                        fontWeight: bold,
                                        fontSize: 10.0,
                                        color: Color.fromARGB(
                                            255, 255, 255, 255))),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
