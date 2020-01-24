import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
void main()=>runApp(MyApp());
class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String textValue='hello nagesh';
  FirebaseMessaging firebaseMessaging=new FirebaseMessaging();
  @override
  void initState(){
firebaseMessaging.configure(
  onLaunch: (Map <String, dynamic> msg){
print('onLaunc called');

  },
  onResume: (Map <String, dynamic> msg){
print('onResume called');

  },
  onMessage: (Map <String, dynamic> msg){
print('onMessage called');

  },
);
firebaseMessaging.requestNotificationPermissions(
  const IosNotificationSettings(
alert: true,
sound: true,
badge: true,
  )
);
firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings){
print("ios registered");
});
firebaseMessaging.getToken().then((token){
update(token);
});
  }
  update(String token){
    print(token);
    textValue=token;
    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("PUSH Notifications"),
        ),
        body: Center(
          child: Text(textValue),
        ),
      ),
    );
  }
}