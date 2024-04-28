import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runner/main.dart';

class StopWatch extends StatefulWidget {
  StopWatch({super.key});
  static const route = '/stopwatch';

  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  //controller in listView.BUILDER
  final scrollController = ScrollController();
  //ItemExtent in listView
  double itemHighInListView = 60;
  //list
  final listLab = <int>[];
  //variable to method Start ,Lab ,STop
  int miliseconds = 0;
  int seconds = 0;
  Timer? timer;
  bool isRunning = false;
  @override
  Widget build(BuildContext context) { 
    void start() {
      timer = Timer.periodic(
        const Duration(milliseconds: 100),
        (timer) {
          setState(() {
            miliseconds += 100;
          });
        },
      );
      isRunning = true;
    }

    String secondText(int seconds) {
      final sec = seconds / 1000;
      return '$sec';
    }

    void lab() {
      setState(() {
        listLab.add(miliseconds);
        miliseconds = 0;
        scrollController.animateTo(
          itemHighInListView * listLab.length,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      });
    }

    void stop() {
      if (isRunning) {
        timer!.cancel();
        setState(() {
          isRunning = false;
        });
      }
      return;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(sharedpref!.getString('name').toString()),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lap ${listLab.length + 1}',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    '${secondText(miliseconds)} Second',
                    style: const TextStyle(
                      fontSize: 28.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: isRunning ? null : start,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          ),
                          child: const Text('Start'),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        ElevatedButton(
                          onPressed: lab,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.orange),
                          ),
                          child: const Text('Lap'),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        ElevatedButton(
                          onPressed: isRunning ? stop : null,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.red),
                          ),
                          child: const Text(
                            'Stop',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                       sharedpref!.clear();
                      Get.offAllNamed("/");
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                controller: scrollController,
                itemExtent: itemHighInListView,
                scrollDirection: Axis.vertical,
                itemCount: listLab.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 50),
                    title: Text('Lab ${index + 1}'),
                    trailing: Text('${secondText(listLab[index])} Second'),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
