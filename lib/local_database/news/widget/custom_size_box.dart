// custom_sized_box.dart
import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double height;
  final double width;

  const CustomSizedBox.h5({Key? key})
      : height = 5.0,
        width = 0.0,
        super(key: key);

  const CustomSizedBox.h10({Key? key})
      : height = 10.0,
        width = 0.0,
        super(key: key);

  const CustomSizedBox.w5({Key? key})
      : height = 0.0,
        width = 5.0,
        super(key: key);

  const CustomSizedBox.w10({Key? key})
      : height = 0.0,
        width = 10.0,
        super(key: key);
  const CustomSizedBox.h4({Key? key})
      : height = 4.0,
        width = 0.0,
        super(key: key);
  const CustomSizedBox.h8({Key? key})
      : height = 8.0,
        width = 0.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
