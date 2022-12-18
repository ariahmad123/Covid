// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, unused_import, unused_element, unused_local_variable, unnecessary_const, unnecessary_import, avoid_unnecessary_containers

import 'dart:ui';
import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart ';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/views/signin.dart';
import 'package:flutter_application_1/views/detail.dart';
import '../widgets/widgets.dart';
import '../views/theme.dart';
import "../models/city.dart";
import "../models/plus.dart";

String? keyCity;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<HomeView> {
  int _selectedNavbar = 0;
  int listC = 0;
  var sessions = [];

  bool isVisible = false;

  var pincode = "";

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    print(pincode);
    print(keyCity);

    super.initState();
    fetchCovid();
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget banner() {
      return Container(
        margin: EdgeInsets.only(
          // left: defaultMargin,
          // top: 25.0,
          // right: defaultMargin,
          bottom: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30),
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
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 10),
              // changes position of shadow
            ),
          ],
        ),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 30.0,
                  top: 0.0,
                  bottom: defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lawan",
                      style: whiteTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 30.0,
                      ),
                    ),
                    Text(
                      "COVID-19",
                      style: whiteTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(height: defaultMargin),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/3Dcovid.png',
                width: 200.0,
              ),
            ],
          ),
        ),
      );
    }

    List<String> listKota = [
      "Samarinda",
      "Pariaman",
      "Padang",
      "Bukittingi",
      "Solok",
      "Sawah Lunto",
      "Padang Panjang"
    ];

    Widget dropdown() {
      return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 10.0,
                // top: defaultMargin,
                right: 10.0,
                bottom: defaultMargin,
                // bottom: defaultMargin,
              ),
              child: DropdownSearch<City>(
                dropdownSearchDecoration: InputDecoration(
                  labelText: "Pilih Kota",
                  hintText: "Pilih kota sesuai tempatmu",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                mode: Mode.DIALOG,
                showSearchBox: true,
                onChanged: (value) {
                  keyCity = value?.key.toString().replaceAll(RegExp(r" "), "_");
                  setState(() {
                    isVisible = true;
                    keyCity =
                        value?.key.toString().replaceAll(RegExp(r" "), "_");
                  });
                },
                dropdownBuilder: (context, selectedItem) =>
                    Text(selectedItem?.key ?? "Belum memilih kota"),
                popupItemBuilder: (context, item, isSelected) => ListTile(
                  title: Text(item.key),
                ),
                onFind: (text) async {
                  var response = await http.get(Uri.parse(
                      "https://data.covid19.go.id/public/api/prov.json"));

                  if (response.statusCode != 200) {
                    return [];
                  }
                  List allcity = (json.decode(response.body)
                      as Map<String, dynamic>)["list_data"];
                  List<City> allModelCity = [];

                  allcity.forEach((element) {
                    allModelCity.add(City(key: element['key']));
                  });
                  return allModelCity;
                },
              ),
            ),
            // SizedBox(height: 30),
            if (isVisible) ...[
              Container(
                child: FutureBuilder<Covid>(
                  future: fetchCovid(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
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
                              offset:
                                  Offset(0, 3), // changes position of shadow
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
                                  top: 20.0,
                                  bottom: 20.0,
                                ),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Text(snapshot.data!.provinsi.toString(),
                                          style: blackTextStyle.copyWith(
                                              fontWeight: bold,
                                              fontSize: 20.0,
                                              color: Color.fromARGB(
                                                  255, 0, 0, 0))),
                                      SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(60),
                                                  color: Colors.red
                                                      .withOpacity(0.2),
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
                                                snapshot.data!.kasus_dengan_tgl
                                                    .toString(),
                                                style: blackTextStyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 20.0,
                                                  color: Color.fromARGB(
                                                      255, 255, 81, 0),
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
                                                  color: Color.fromARGB(
                                                      255, 255, 81, 0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(60),
                                                  color: Colors.green
                                                      .withOpacity(0.2),
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
                                                width: 160.0,
                                              ),
                                              Text(
                                                snapshot
                                                    .data!.meninggal_dengan_tgl
                                                    .toString(),
                                                style: blackTextStyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 20.0,
                                                  color: Color.fromARGB(
                                                      255, 0, 192, 13),
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
                                                  color: Color.fromARGB(
                                                      255, 0, 192, 13),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(60),
                                                  color: Color.fromARGB(
                                                          255, 255, 17, 0)
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
                                                snapshot.data!.sembuh_dengan_tgl
                                                    .toString(),
                                                style: blackTextStyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 20.0,
                                                  color: Color.fromARGB(
                                                      255, 255, 0, 0),
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
                                                  color: Color.fromARGB(
                                                      255, 255, 0, 0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return const CircularProgressIndicator();
                  }),
                ),
              ),
            ]
          ],
        ),
      );
    }

    Widget text() {
      return Container(
        margin: EdgeInsets.only(
          left: 15.0,
          // top: defaultMargin,
          right: 15.0,
          bottom: defaultMargin,
          // bottom: defaultMargin,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Update Kasus Corona",
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 20.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Terakhir Diupdate Tanggal 17 Oktober ",
                    style: TextStyle(
                      fontSize: 10.5,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.230),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Detail()),
                      );
                    },
                    child: Text(
                      "lihat detail",
                      style: TextStyle(
                        fontSize: 15.5,
                        color: Color.fromARGB(255, 0, 55, 255),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Color.fromARGB(255, 47, 155, 165),
                    size: 10.5,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget data() {
      return Column(
        children: [
          Container(
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
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
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
                                    height: 10.0,
                                    // width: 100.0,
                                  ),
                                  Text(
                                    "80",
                                    style: blackTextStyle.copyWith(
                                      fontWeight: bold,
                                      fontSize: 50.0,
                                      color: Color.fromARGB(255, 255, 81, 0),
                                    ),
                                  ),
                                  Text(
                                    "Positif",
                                    style: blackTextStyle.copyWith(
                                      fontWeight: bold,
                                      fontSize: 15.0,
                                      color: Color.fromARGB(255, 255, 81, 0),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(60),
                                      color: Colors.green.withOpacity(0.2),
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
                                    height: 10.0,
                                    width: 180.0,
                                  ),
                                  Text(
                                    "18",
                                    style: blackTextStyle.copyWith(
                                      fontWeight: bold,
                                      fontSize: 50.0,
                                      color: Color.fromARGB(255, 0, 192, 13),
                                    ),
                                  ),
                                  Text(
                                    "Sembuh",
                                    style: blackTextStyle.copyWith(
                                      fontWeight: bold,
                                      fontSize: 15.0,
                                      color: Color.fromARGB(255, 0, 192, 13),
                                    ),
                                  ),
                                ],
                              ),
                              Column(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
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
                                  height: 10.0,
                                  // width: 100.0,
                                ),
                                Text(
                                  "50",
                                  style: blackTextStyle.copyWith(
                                    fontWeight: bold,
                                    fontSize: 50.0,
                                    color: Color.fromARGB(255, 255, 0, 0),
                                  ),
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
          ),
        ],
      );
    }

    Widget text1() {
      return Container(
        margin: EdgeInsets.only(
          left: 15.0,
          // top: defaultMargin,
          right: 15.0,
          bottom: defaultMargin,
          // bottom: defaultMargin,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Protocol 5M",
                style: blackTextStyle.copyWith(
                  fontWeight: bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget protocol() {
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
                  top: 30.0,
                  bottom: 30.0,
                ),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFF3383CD),
                                      Color(0xFF11249F),
                                    ],
                                  ),
                                ),
                                child: ClipRRect(
                                  child: Image(
                                    image: AssetImage('assets/images/1.png'),
                                    width: 60.0,
                                    height: 60.0,
                                  ),
                                ),
                              ),
                              Text(
                                "Memakai \n Masker",
                                style: blackTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 40.0,
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFF3383CD),
                                      Color(0xFF11249F),
                                    ],
                                  ),
                                ),
                                child: ClipRRect(
                                  child: Image(
                                    image: AssetImage('assets/images/2.png'),
                                    width: 60.0,
                                    height: 60.0,
                                  ),
                                ),
                              ),
                              Text(
                                "Mencuci \n Tangan",
                                style: blackTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 40.0,
                          ),
                          Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color(0xFF3383CD),
                                    Color(0xFF11249F),
                                  ],
                                ),
                              ),
                              child: ClipRRect(
                                child: Image(
                                  image: AssetImage('assets/images/3.png'),
                                  width: 60.0,
                                  height: 60.0,
                                ),
                              ),
                            ),
                            Text(
                              "Menjaga \n Jarak",
                              style: blackTextStyle.copyWith(
                                fontWeight: bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFF3383CD),
                                      Color(0xFF11249F),
                                    ],
                                  ),
                                ),
                                child: ClipRRect(
                                  child: Image(
                                    image: AssetImage('assets/images/4.png'),
                                    width: 60.0,
                                    height: 60.0,
                                  ),
                                ),
                              ),
                              Text(
                                "Menghindari \n Kerumunan",
                                style: blackTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xFF3383CD),
                                      Color(0xFF11249F),
                                    ],
                                  ),
                                ),
                                child: ClipRRect(
                                  child: Image(
                                    image: AssetImage('assets/images/5.png'),
                                    width: 60.0,
                                    height: 60.0,
                                  ),
                                ),
                              ),
                              Text(
                                "Menggunakan\nHand Sanitizer",
                                style: blackTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
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
    }

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            banner(),
            text(),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  dropdown(),
                  text1(),
                  protocol(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Covid> fetchCovid() async {
  final response = await http.get(Uri.parse(
      'https://data.covid19.go.id/public/api/prov_detail_$keyCity.json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(keyCity);
    return Covid.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Covid');
  }
}

class Covid {
  final String provinsi;
  final int kasus_dengan_tgl;
  final int meninggal_dengan_tgl;
  final int sembuh_dengan_tgl;

  const Covid({
    required this.provinsi,
    required this.kasus_dengan_tgl,
    required this.meninggal_dengan_tgl,
    required this.sembuh_dengan_tgl,
  });

  factory Covid.fromJson(Map<String, dynamic> json) {
    return Covid(
      provinsi: json['provinsi'],
      kasus_dengan_tgl: json['kasus_dengan_tgl'],
      meninggal_dengan_tgl: json['meninggal_dengan_tgl'],
      sembuh_dengan_tgl: json['sembuh_dengan_tgl'],
    );
  }
}
