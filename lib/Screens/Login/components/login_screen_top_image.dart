import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';





import '../../../constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Customer LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 20.0),
        ),

        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child:  Lottie.asset('assets/icons/tailor.json')
            ),
            const Spacer(),
          ],
        ),

      ],
    );
  }
}