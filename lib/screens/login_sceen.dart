import 'dart:convert';

import 'package:daelim/config.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class LoginSrceen extends StatefulWidget {
  const LoginSrceen({super.key});

  @override
  State<LoginSrceen> createState() => _LoginSrceenState();
}

class _LoginSrceenState extends State<LoginSrceen> {
  // Note : 로그인 API 호출
  void _onFetchedApi() async {
    final loginData = {
      'email': '202230331@daelim.ac.kr',
      'password': '202230331'
    };

    final response =
        await http.post(Uri.parse(authUrl), body: jsonEncode(loginData));

    // Log.green(response.body);
    Log.green({'status': response.statusCode, 'body': response.body});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: ElevatedButton(
          onPressed: _onFetchedApi,
          // onPressed: () {
          //   _onPressed();
          //   _onPressed.call();  //nullable일 수 있을 떄 call    변수를 반환할 경우 자주 사용
          // },
          child: const Text('api호출')),
    )));
  }
}
//b눌러서 테마 변경