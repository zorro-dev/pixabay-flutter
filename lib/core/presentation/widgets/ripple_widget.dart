import 'package:flutter/material.dart';

class RippleWidget extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final Color? color;
  final Color? rippleBackgroundColor;
  final Color? rippleForegroundColor;
  final BorderRadius? borderRadius;
  final Function()? onTap;
  final Function()? onLongPress;

  static const Color defaultRippleBackgroundColor = Color(0x26A0A0A0);
  static const Color defaultRippleForegroundColor = Color(0x26A9A9A9);

  const RippleWidget({
    required this.child,
    this.onTap,
    this.onLongPress,
    this.borderRadius,
    this.color = Colors.transparent,
    this.rippleBackgroundColor = defaultRippleBackgroundColor,
    this.rippleForegroundColor = defaultRippleForegroundColor,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !enabled,
      child: Material(
        color: color,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          splashColor: rippleForegroundColor,
          highlightColor: rippleBackgroundColor,
          onTap: () {
            onTap?.call();
          },
          onLongPress: onLongPress,
          child: child,
        ),
      ),
    );
  }
}
