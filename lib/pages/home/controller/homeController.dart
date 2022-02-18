import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var counter = 0.obs;
  //duration Passed In Second when long press happend
  var durationPassedInSecond = 0.obs;

  Rx<Color> btnColor = const Color(0xFF1B84DA).obs;
}
