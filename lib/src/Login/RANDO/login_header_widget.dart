import 'package:esugclassmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          'assets/svgs/home.svg',
          semanticsLabel: 'Home SVG',
          width: width * 0.3,
          height: height * 0.3,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          tLoginTitle,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          tLoginSubTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
