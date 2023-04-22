import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:trinetra/bargraph/barGraph.dart';

class DailyStreak extends StatefulWidget {
  const DailyStreak({super.key});

  @override
  State<DailyStreak> createState() => _DailyStreakState();
}

class _DailyStreakState extends State<DailyStreak> {
  final user = FirebaseAuth.instance.currentUser;

  List cal = [10.0, 20.0, 3.0, 8.5, 10.0, 56.0, 92.0];

  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 4,
    "Xamarin": 2,
    "Ionic": 7,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user!.uid)
                    .snapshots(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: Text("Loading ..."));
                  }
                  var details = snapshot.data;
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text("Hi, ${details!['username']}"),
                          subtitle: Text("Let's check your activity"),
                          trailing: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Image.asset(
                              'assets/images/male.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 25, left: 25, right: 25, bottom: 30),
                        child: SizedBox(
                          height: 220,
                          child: BarGraph(weeklySummary: cal),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Divider(
                          thickness: 1.5,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Today's Data"),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 100, top: 25),
                        child: Center(
                          child: PieChart(
                            dataMap: dataMap,
                            chartRadius: MediaQuery.of(context).size.width / 1.8,
                            legendOptions: LegendOptions(
                              legendPosition: LegendPosition.bottom,
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
