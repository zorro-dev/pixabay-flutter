import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pixabay_flutter/core/presentation/utils/context_extensions.dart';

class LoadingWidget extends StatelessWidget {
  final Color? color;

  const LoadingWidget({
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.theme.colors.menu.background,
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: const SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      );
    } else {
      return Center(
        child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              color: color,
            )),
      );
    }
  }
}
