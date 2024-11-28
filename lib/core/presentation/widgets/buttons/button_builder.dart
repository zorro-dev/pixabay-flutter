import 'package:flutter/material.dart';
import 'package:pixabay_flutter/core/presentation/utils/context_extensions.dart';

class ButtonBuilderArgs {
  final bool tapped;

  ButtonBuilderArgs({required this.tapped});
}

class ButtonBuilder extends StatefulWidget {
  final Duration? delay;
  final Function()? onTap;
  final Function()? onLongTap;
  final Widget Function(BuildContext context, ButtonBuilderArgs args) builder;

  const ButtonBuilder({
    required this.builder,
    this.delay,
    this.onTap,
    this.onLongTap,
    super.key,
  });

  @override
  State<ButtonBuilder> createState() => _ButtonBuilderState();
}

class _ButtonBuilderState extends State<ButtonBuilder> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.onTap == null && widget.onLongTap == null,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onTap,
        onLongPress: widget.onLongTap,
        onTapDown: (details) => setState(() => tapped = true),
        onTapUp: (details) async {
          final delay = widget.delay;
          if (delay != null) {
            await Future.delayed(delay);
          }
          if (mounted) setState(() => tapped = false);
        },
        onTapCancel: () => setState(() => tapped = false),
        child: widget.builder(context, ButtonBuilderArgs(tapped: tapped)),
      ),
    );
  }
}

class ButtonBuilders {
  static Widget base({
    Key? key,
    required Widget child,
    Function()? onTap,
    Function()? onLongTap,
    double tappedOpacity = 0.9,
    double tappedScale = 0.95,
  }) =>
      ButtonBuilder(
        key: key,
        onTap: onTap,
        onLongTap: onLongTap,
        delay: const Duration(milliseconds: 100),
        builder: (context, args) {
          return AnimatedOpacity(
            opacity: args.tapped ? tappedOpacity : 1,
            duration: const Duration(milliseconds: 100),
            child: AnimatedScale(
              scale: args.tapped ? tappedScale : 1,
              duration: const Duration(milliseconds: 100),
              child: child,
            ),
          );
        },
      );

  static Widget back({
    Function()? onTap,
    Color? color,
  }) =>
      ButtonBuilder(
        onTap: onTap,
        delay: const Duration(milliseconds: 100),
        builder: (context, args) {
          return Container(
            width: kToolbarHeight,
            height: kToolbarHeight,
            padding: const EdgeInsets.all(16),
            child: AnimatedScale(
              scale: args.tapped ? 0.9 : 1,
              duration: const Duration(milliseconds: 100),
              child: Icon(
                Icons.arrow_back,
                color: (color ?? context.theme.colors.appBar.icon).withOpacity(args.tapped ? 0.5 : 1),
              ),
            ),
          );
        },
      );

  static Widget confirm({
    void Function()? onTap,
    Color? color,
  }) =>
      ButtonBuilder(
        onTap: onTap,
        delay: const Duration(milliseconds: 100),
        builder: (context, args) {
          return Container(
            width: kToolbarHeight * 0.8,
            height: kToolbarHeight * 0.8,
            padding: const EdgeInsets.all(10),
            child: AnimatedScale(
              scale: args.tapped ? 0.9 : 1.0,
              duration: const Duration(milliseconds: 100),
              child: Icon(
                Icons.check_circle,
                color: (color ?? context.theme.colors.appBar.icon).withOpacity(args.tapped ? 0.5 : 1),
              ),
            ),
          );
        },
      );

  static Widget settings({
    Function()? onTap,
    Color? color,
  }) =>
      ButtonBuilder(
        onTap: onTap,
        delay: const Duration(milliseconds: 100),
        builder: (context, args) {
          return Container(
            height: kToolbarHeight,
            padding: const EdgeInsets.all(14),
            child: AnimatedScale(
              scale: args.tapped ? 0.8 : 0.9,
              duration: const Duration(milliseconds: 100),
              child: Icon(
                Icons.settings,
                color: (color ?? context.themeData.primaryColor),
              ),
            ),
          );
        },
      );
}
