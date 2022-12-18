import 'dart:convert';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../views/theme.dart';
import "../models/city.dart";
import "../models/plus.dart";

String? keyCity;

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11249F),
        title: const Text("Results"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          DropdownSearch<City>(
            mode: Mode.DIALOG,
            showSearchBox: true,
            onChanged: (value) {
              keyCity = value?.key.toString().replaceAll(RegExp(r" "), "_");
              setState(() {
                isVisible = true;
                keyCity = value?.key.toString().replaceAll(RegExp(r" "), "_");
              });
            },
            dropdownBuilder: (context, selectedItem) =>
                Text(selectedItem?.key ?? "Belum memilih kota"),
            popupItemBuilder: (context, item, isSelected) => ListTile(
              title: Text(item.key),
            ),
            onFind: (text) async {
              var response = await http.get(
                  Uri.parse("https://data.covid19.go.id/public/api/prov.json"));

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
          SizedBox(height: 30),
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
                                    Text(snapshot.data!.provinsi.toString(),
                                        style: blackTextStyle.copyWith(
                                            fontWeight: bold,
                                            fontSize: 20.0,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0))),
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
                                                color:
                                                    Colors.red.withOpacity(0.2),
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
