import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Logo extends StatelessWidget {

  final title;

  // Logo에 const도 삭제해야 함 값이 뭐가 들어올지 모름
  // this.title에 null이 아닌 값이 무조건 지정되게 설정
  Logo(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/logo.svg", height: 70, width: 70),
        Text(
          title,
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
