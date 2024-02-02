import 'package:flutter/material.dart';
import 'package:tentweny_demo/ui/common/app_strings.dart';

class CustomErrorWidget extends StatelessWidget {
  final Function()? onRetry;
  final String? message;

  const CustomErrorWidget({
    Key? key,
    this.onRetry,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(message ?? ksGenericFetchingError),
        ),
        const SizedBox(
          height: 10,
        ),
        if (onRetry != null)
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              maximumSize: const Size(200, 50),
            ),
            onPressed: onRetry,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh),
                SizedBox(
                  width: 5,
                ),
                Text('Retry'),
              ],
            ),
          )
      ],
    );  
  }
}
