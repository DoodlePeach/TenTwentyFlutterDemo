import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class CustomImageErrorWidget extends StatelessWidget {
  const CustomImageErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: color1, width: 2.0),
          borderRadius: BorderRadius.circular(16),
          color: color6),
      child: const Center(
        child: Icon(
          Icons.not_interested,
          color: color1,
        ),
      ),
    );
  }
}
