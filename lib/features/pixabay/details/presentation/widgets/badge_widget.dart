import 'package:flutter/material.dart';
import 'package:pixabay_flutter/core/presentation/utils/context_extensions.dart';

class BadgeWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const BadgeWidget({
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          subtitle,
          style: context.theme.texts.title3.bold.copyWith(
            overflow: TextOverflow.ellipsis,
            color: context.theme.colors.texts.text1,
          ),
        ),
        Text(
          title,
          style: context.theme.texts.body2.bold.copyWith(
            overflow: TextOverflow.ellipsis,
            color: context.theme.colors.texts.text1,
          ),
        ),
      ],
    );
  }
}
