import 'dart:async';
import 'package:adminpanel/screens/sign-in-screen.dart';
import 'package:adminpanel/service/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utilis/constant.dart';
import 'main-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  NotificationService notificationService = NotificationService();
  @override
  void initState() {
    super.initState();

    print("User id=> ${user!.uid}");
    getToken();

    Timer(Duration(seconds: 3), () {
      if (user != null) {
        Get.offAll(() => MainScreen());
      } else {
        Get.offAll(() => SignInScreen());
      }
    });
  }

  getToken() async {
    String userDeviceToken = await notificationService.getDeviceToken();

    print("token => $userDeviceToken");
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.appScendoryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Text(
                  "Admin Panel",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPoweredBy,
                style: TextStyle(
                    color: AppConstant.appTextColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
