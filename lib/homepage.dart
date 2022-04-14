// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lpg_agaency_task/mainscreen.dart';
import 'package:lpg_agaency_task/user_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();
  TextStyle bold = TextStyle(fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Name",
                style: bold,
              ),
              Material(
                elevation: 1,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Phone",
                style: bold,
              ),
              Material(
                elevation: 1,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: phone,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Address",
                style: bold,
              ),
              Material(
                elevation: 1,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: address,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Pincode",
                style: bold,
              ),
              Material(
                elevation: 1,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: pincode,
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () async {
                  final user = User(
                      name: name.text,
                      phone: phone.text,
                      address: address.text,
                      pincode: pincode.text);
                  bool val = await captureData(user);
                  if (val) {
                    name.text = '';
                    phone.text = '';
                    address.text = '';
                    pincode.text = '';
                  }

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Material(
                    elevation: 5,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 40,
                      width: 80,
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
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

  Future<bool> captureData(User user) async {
    final data = FirebaseFirestore.instance.collection('data').doc();
    user.id = data.id;
    final dataJson = user.toJson();
    await data.set(dataJson);
    return true;
  }
}
