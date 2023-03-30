import 'package:flutter/material.dart';

import 'components/custom_text_form_field.dart';
import 'components/logo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          minimumSize: Size(double.infinity, 60),
        ),
      )),

      debugShowCheckedModeBanner: false,
      // initialRoute : 앱이 시작될 때 자동으로 표시될 화면 경로
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
      // home: LoginPage()
    );
  }
}

class LoginPage extends StatelessWidget {

  // 1. GlobalKey를 만든다
  final _formKey = GlobalKey<FormState>();


  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 변수가 없이 항상 같은 그림일 것 같으면 자동으로 const 붙여라고 한다.
    // const는 컴파일 시점에 한번 뜨는 거임
    // 동일한 그림이면 한번, 그림이 바뀌면 new가 2번
    // 그림이 바뀌면 const를 빼면 됨
    return Scaffold(
      body: ListView(
        children: [
          Logo("Login"),
          Form(
            key: _formKey, // 2. GlobalKey를 연결한다.
            child: Column(
              children: [
                CustomTextFormField("email"),
                CustomTextFormField("password", isObscure: true),
                TextButton(
                  onPressed: () {

                    // 상태가 null일 수 있기 때문에 !를 붙여서 무조건 있다고 명시
                    if(_formKey.currentState!.validate()){
                      Navigator.pushNamed(context, "/home");
                    }
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                    // pushAndRemoveUntil : 그전에 스택에 쌓여있는 것을 다 지움
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 변수가 없이 항상 같은 그림일 것 같으면 자동으로 const 붙여라고 한다.
    // const는 컴파일 시점에 한번 뜨는 거임
    // 동일한 그림이면 한번, 그림이 바뀌면 new가 2번
    // 그림이 바뀌면 const를 빼면 됨
    return Scaffold(
        body: Container(
      color: Colors.red,
    ));
  }
}
