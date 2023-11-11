import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class CustomPayTextField extends StatelessWidget {
  final String fieldName;
  const CustomPayTextField({
    super.key,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldName,
            style: Styles.style20,
          ),
          TextFormField(
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            cursorColor: Colors.blue,
            cursorHeight: 20,
            textAlignVertical: TextAlignVertical.center,
            style: Styles.styleBold20,
            scrollPadding: EdgeInsets.zero,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 10),
              border: UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
