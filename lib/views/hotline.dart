import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../views/theme.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Hotline extends StatefulWidget {
  const Hotline({Key? key}) : super(key: key);

  @override
  State<Hotline> createState() => _HotlineState();
}

class _HotlineState extends State<Hotline> {
  @override
  Widget build(BuildContext context) {
    Widget buildButton(
            {required VoidCallback onClicked,
            required String text,
            required image,
            required String text1,
            required Color color,
            required Color color1}) =>
        Container(
          padding: EdgeInsets.only(
            bottom: 5.0,
            left: defaultMargin,
            right: defaultMargin,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              // shadow
              elevation: 6.0,
            ),
            onPressed: onClicked,
            child: Row(
              children: [
                Image.asset(
                  image,
                  width: 50.0,
                  height: 70.0,
                ),
                SizedBox(width: 10.0),
                Text(
                  text,
                  style: blackTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16.0,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.only(
                    right: 20.0,
                    left: 20.0,
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: color,
                  ),
                  child: Text(
                    text1,
                    style: blackTextStyle.copyWith(
                        fontWeight: bold, fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF11249F),
        title: const Text("Hotline"),
      ),
      body: Container(
        margin: EdgeInsets.only(
          top: 10.0,
          bottom: 20.0,
        ),
        child: ListView(
          children: [
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Balikpapan',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('08115231919');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Bontang',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('08125368104');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Berau',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('082149492491');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Paser',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('08125877983');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'PPU',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('081354818119');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Kutai Kartanegara',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('082251171009');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Kutai Timur',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('081347391313');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Kutai Barat',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('082251085231');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Mahakam Ulu',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber(' 085246768633');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Depok ',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('119');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Majalengka ',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('112');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Sukabumi ',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('08001000119');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Bandung ',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('082118219287');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Garut ',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('0262-2802800');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Indramayu ',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('08111333314');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Karawang ',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('0267-321000');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Kuningan ',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('081388284346');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Cirebon ',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('081998800119');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Bekasi',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('021 89910039');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Bogor',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('08111116093');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Purwakarta',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('081909514472');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Bogor',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('119');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Cianjur',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('085321161119');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Ciamis',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber(' 085314993901');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Karawang',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('085282537355');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Cimahi',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('08122126256');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Banjar',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('085223344119');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Pangandaran',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('085320643695');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'Sumedang',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('119');
                }),
            const SizedBox(height: 10.0),
            buildButton(
                image: 'assets/images/phone.png',
                text: 'West Bandung',
                text1: 'PANGGIL',
                color: Color.fromARGB(255, 16, 190, 16),
                color1: Colors.green.withOpacity(0.2),
                onClicked: () {
                  FlutterPhoneDirectCaller.callNumber('089522434611');
                }),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
