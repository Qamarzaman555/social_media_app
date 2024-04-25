import 'package:flutter/material.dart';

import '../color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color, textColor;
  final double? height, width;
  final bool loading;

  const RoundButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.color = AppColors.dividedColor,
      this.textColor = AppColors.whiteColor,
      this.height,
      this.width,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPressed,
      child: Container(
          height: height ?? 60,
          width: width ?? MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(50)),
          child: Center(
              child: loading
                  ? const CircularProgressIndicator()
                  : Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 16, color: textColor),
                    ))),
    );
  }
}
