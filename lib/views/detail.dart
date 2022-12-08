import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../views/theme.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
    var url = Uri.parse('https://data.covid19.go.id/public/api/prov.json');
    var response = await http.get(url);
    var result = jsonDecode(response.body);
    print(result);
    setState(() {
      sessions = result['list_data'];
      listC = sessions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 47, 155, 165),
        title: const Text("Results"),
      ),
      body: Container(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: defaultMargin,
                            right: defaultMargin,
                            top: 10.0,
                            bottom: 10.0,
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                Text(sessions[index]['key'],
                                    style: blackTextStyle.copyWith(
                                        fontWeight: bold,
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 16, 206, 70))),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            color: Colors.red.withOpacity(0.2),
                                          ),
                                          child: ClipRRect(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/vector.png'),
                                              width: 30.0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                          // width: 100.0,
                                        ),
                                        Text(
                                          sessions[index]['jumlah_kasus']
                                              .toString(),
                                          style: blackTextStyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 20.0,
                                            color:
                                                Color.fromARGB(255, 255, 81, 0),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                          // width: 100.0,
                                        ),
                                        Text(
                                          "Positif",
                                          style: blackTextStyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 15.0,
                                            color:
                                                Color.fromARGB(255, 255, 81, 0),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            color:
                                                Colors.green.withOpacity(0.2),
                                          ),
                                          child: ClipRRect(
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/vector2.png'),
                                              width: 30.0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                          width: 180.0,
                                        ),
                                        Text(
                                          sessions[index]['jumlah_sembuh']
                                              .toString(),
                                          style: blackTextStyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 20.0,
                                            color:
                                                Color.fromARGB(255, 0, 192, 13),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                          // width: 100.0,
                                        ),
                                        Text(
                                          "Sembuh",
                                          style: blackTextStyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 15.0,
                                            color:
                                                Color.fromARGB(255, 0, 192, 13),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(60),
                                          color: Color.fromARGB(255, 255, 17, 0)
                                              .withOpacity(0.2),
                                        ),
                                        child: ClipRRect(
                                          child: Image(
                                            image: AssetImage(
                                                'assets/images/vector3.png'),
                                            width: 30.0,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                        // width: 100.0,
                                      ),
                                      Text(
                                        sessions[index]['jumlah_meninggal']
                                            .toString(),
                                        style: blackTextStyle.copyWith(
                                          fontWeight: bold,
                                          fontSize: 20.0,
                                          color: Color.fromARGB(255, 255, 0, 0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                        // width: 100.0,
                                      ),
                                      Text(
                                        "Meninggal",
                                        style: blackTextStyle.copyWith(
                                          fontWeight: bold,
                                          fontSize: 15.0,
                                          color: Color.fromARGB(255, 255, 0, 0),
                                        ),
                                      ),
                                    ]),
                                  ],
                                )
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
