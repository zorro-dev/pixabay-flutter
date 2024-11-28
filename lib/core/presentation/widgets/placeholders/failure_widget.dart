import 'package:flutter/material.dart';
import 'package:pixabay_flutter/core/domain/error/failures.dart';
import 'package:pixabay_flutter/core/presentation/utils/context_extensions.dart';
import 'package:pixabay_flutter/core/presentation/widgets/buttons/button_builder.dart';
import 'package:pixabay_flutter/l10n/generated/l10n.dart';

class FailureWidget extends StatelessWidget {
  final Failure? failure;
  final VoidCallback? onTap;

  const FailureWidget({
    this.failure,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Builder(
            builder: (context) {
              final failure = this.failure;
              String? message = failure?.message(context);

              message ??= "${S.of(context).somethingWentWrong}...";

              return Text(
                message,
                style: context.theme.texts.caption1.regular.copyWith(
                  color: context.theme.colors.texts.text3,
                ),
              );
            }
          ),
          const SizedBox(height: 10),
          ButtonBuilders.base(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: context.theme.colors.buttons.background1,
              ),
              child: Text(
                S.of(context).tryAgain,
                style: context.theme.texts.body2.regular.copyWith(
                  color: context.theme.colors.buttons.text1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
