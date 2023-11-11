import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/styles.dart';

AppBar buildAppBar(BuildContext context, {required String title, bool isFirstPage = false}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        isFirstPage ? null : Navigator.pop(context);
      },
      icon: SvgPicture.asset('assets/images/arrow_back.svg'),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    title: Text(
      title,
      style: Styles.style25,
    ),
  );
}
