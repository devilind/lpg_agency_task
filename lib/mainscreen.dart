// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lpg_agaency_task/demo_data.dart';
import 'package:lpg_agaency_task/geolocator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List temp = lpgAgencies;
  double myLat = 19.181418649594427;
  double myLong = 73.06378126121645;
  Future getDistance() async {
    temp.sort((a, b) => (a.name).compareTo(b.name));
    Position position = await determinePosition();
    for (LpgAgency i in temp) {
      i.distance = await Geolocator.distanceBetween(
          myLat,
          myLong,
          // position.latitude, position.longitude,
          i.latitude,
          i.longitude);
      i.distance.toInt();
    }
  }

  @override
  void initState() {
    // getDistance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: getDistance(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (temp[temp.length - 1].distance == 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: temp.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              double dis = (temp[index].distance.toInt() / 1000).toDouble();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  color: Colors.white,
                  elevation: 2,
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          'https://im.hunt.in/cg/poun/puducherry/City-Guide/LPG-Puducherry.jpg',
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill,
                        ),
                        Text(temp[index].name),
                        Text("$dis Km")
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
