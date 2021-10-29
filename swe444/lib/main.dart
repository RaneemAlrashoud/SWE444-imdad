import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Functions/decisions_tree.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:meras/Controllers/NotificationsHandler.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: false);
FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    await createLocalNotification(message: message.data);
  });

 // App is opened
  FirebaseMessaging.onMessageOpenedApp.listen((message) async {
    await createLocalNotification(message: message.data);
  });

  initializeLocalNotification();
  AwesomeNotifications().actionStream.listen((receivedNotification) {
    Get.to(ADlistScreen());
  });
  FirebaseMessaging.instance.getToken().then((token) {
    print(token);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DecisionsTree(),
      ),
      designSize: const Size(390, 844),
    );
  }
}
