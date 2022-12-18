// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, unused_field, unused_import, unused_element, unused_local_variable, unnecessary_const, unnecessary_import, avoid_unnecessary_containers

import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart ';
import 'package:flutter_application_1/views/signin.dart';
import 'package:flutter_application_1/views/detail2.dart';
import '../widgets/widgets.dart';
import '../views/theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<HomeView> {
  int _selectedNavbar = 0;

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

    String nKota = "Samarinda";
    int? nilaiKota;

    void pilihKota(String value) {
      //menampilkan kota yang dipilih
      setState(() {
        nKota = value;
      });
    }

    Widget dropdown() {
      return Container(
        margin: EdgeInsets.only(
          left: 10.0,
          // top: defaultMargin,
          right: 10.0,
          bottom: defaultMargin,
          // bottom: defaultMargin,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownSearch<String>(
                  mode: Mode.MENU,
                  items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                  onChanged: (value) => print(value),
                  selectedItem: "Brazil"),
            ],
          ),
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
            dropdown(),
            Expanded(
              child: ListView(
                children: [
                  text(),
                  data(),
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
