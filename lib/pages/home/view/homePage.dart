import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltranapp_interview/pages/home/controller/homeController.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();
  final stopwatch = Stopwatch();
  // color of the button when the increment value step is zero
  Color defaultColor = const Color(0xFF1B84DA);
  // color of the button when LongPress and the timer is enabled
  Color onLongPressColor = const Color(0xFFBDDA1B);
  // color of the button when btn is on increment mode
  Color incrementColor = const Color(0xFF0CE64D);

  @override
  Widget build(BuildContext context) {
    homeController.durationPassedInSecond.value = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text("VoltranApp Interview"),
      ),
      floatingActionButton: GestureDetector(
        onLongPressUp: longPressEnd,
        onLongPress: longPressStart,
        child: Obx(() {
          return FloatingActionButton(
            onPressed: incrementCounter,
            child: const Icon(Icons.add),
            backgroundColor: homeController.btnColor.value,
          );
        }),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                "counter : ${homeController.counter}",
                style: const TextStyle(
                  fontSize: 28,
                ),
              );
            }),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }

  void longPressStart() {
    // get back to initial conter value and reset the timer
    stopwatch.reset();
    homeController.counter.value = 0;
    homeController.durationPassedInSecond.value = 0;

    // start the timer and change button color to LongPressColor
    homeController.btnColor.value = onLongPressColor;
    stopwatch.start();
  }

  void longPressEnd() {
    stopwatch.stop();
    // get the time that user holds on long press and set it as a step to increment the Counter
    homeController.durationPassedInSecond.value = stopwatch.elapsed.inSeconds;
    // if long press time is less than 1 Seconds the increment wont work and the button color goes to defaultColor
    homeController.btnColor.value =
        stopwatch.elapsed.inSeconds >= 1 ? incrementColor : defaultColor;
  }

  void incrementCounter() {
    homeController.counter.value += homeController.durationPassedInSecond.value;
  }
}
