import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'main.freezed.dart';

part 'main.g.dart';


void main() {
  runApp(
      ProviderScope(
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class User{


  User(
      this.id,
      this.name,
      this.mobileNumber,
      );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['name'],
      json['mobileNumber'],
    );
  }


  final String? id;

  final String? name;

  final String? mobileNumber;

}




@freezed
abstract class LoginParameter with _$LoginParameter{
  factory LoginParameter({
    required String mobileNumber,
    required String password
  }) = _LoginParameter;

  String get password => password;

  String get mobileNumber => mobileNumber;
}

final userFutureProvider = FutureProvider.family<User, LoginParameter>((ref, params) async{
  http.Response response = await http.get(Uri.parse('uri'));
  final content = json.decode(response.body) as Map<String, dynamic>;
  return User.fromJson(content);
});







class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Container();
  }
}