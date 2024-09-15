import 'dart:convert';

import 'package:daelim/config.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class LoginSrceen extends StatefulWidget {
  const LoginSrceen({super.key});

  @override
  State<LoginSrceen> createState() => _LoginSrceenState();
}

class _LoginSrceenState extends State<LoginSrceen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  bool _isObsecure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  final body = {'email': '202230331@daelim.ac.kr', 'password': '202230331'};

  // Note : 로그인 API 호출
  void _onFetchedApi() async {
    final response = await http.post(Uri.parse(authUrl),
        headers: {}, body: jsonEncode(body));

    // Log.green(response.body);
    Log.green({'status': response.statusCode, 'body': response.body});
  }

  //패스워도 재설정
  void _onRecoveryPassword() {}

  //로그인 버튼
  void _onSignIn() async {
    Log.cyan(_emailController.value.text);
    Log.cyan(_pwController.value.text);

    final response = await http.post(Uri.parse(authUrl),
        body: jsonEncode({
          "email": _emailController.value.text,
          "password": _pwController.value.text,
        }));

    if (response.statusCode == 200) {
      Log.green("Success");
      Log.green(response.body);
    } else {
      Log.red("Failed");
      Log.red(response.body);
    }
  }

  //타이틀 텍스트 위젯
  List<Widget> _buildTitleText() => [
        Text("Hello Again",
            style:
                GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold)),
        15.heightBox,
        Text(
          "Wellcom back you've\nbeen missed!",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 20,
          ),
        ),
      ];

  //람다 예시
  bool noLambda() {
    return false;
  }

  bool Lambda() => false;

  bool get getLambda => false;

  //텍스트 입력 위젯들
  List<Widget> _buildTextFields() => [
        _buildTextField(
          controller: _emailController,
          hintText: "EnterEmail",
        ),
        10.heightBox,
        _buildTextField(
            onObsecure: (down) {
              setState(() {
                _isObsecure = !_isObsecure;
              });
            },
            controller: _pwController,
            hintText: "Password",
            obsecure: _isObsecure)
      ];

//텍스트 입력 위젯
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool? obsecure,
    Function(bool down)? onObsecure,
  }) {
    return TextField(
        controller: controller,
        obscureText: obsecure ?? false,
        decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none),
            suffixIcon: obsecure != null
                ? GestureDetector(
                    onTapDown: (details) => onObsecure?.call(true),
                    onTapUp: (detauls) => onObsecure?.call(false),
                    child: Icon(obsecure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                  )
                : null));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFDEDEE2),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                36.heightBox,
                ..._buildTitleText(),
                25.heightBox,
                ..._buildTextFields(),
                16.heightBox,
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: _onRecoveryPassword,
                      child: Text("Recovery Password",
                          style: GoogleFonts.poppins(fontSize: 12))),
                ),
                16.heightBox,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: _onSignIn,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE46A61),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6))),
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.poppins(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
          //     child: Center(
          //   child: ElevatedButton(
          //       onPressed: _onFetchedApi,
          //       // onPressed: () {
          //       //   _onPressed();
          //       //   _onPressed.call();  //nullable일 수 있을 떄 call    변수를 반환할 경우 자주 사용
          //       // },
          //       child: const Text('api호출')),
          // )
        ));
  }
}
//b눌러서 테마 변경
