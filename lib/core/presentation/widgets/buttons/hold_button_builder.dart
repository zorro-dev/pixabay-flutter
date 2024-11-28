import 'package:flutter/widgets.dart';

class HoldButtonBuilder extends StatefulWidget {
  final Duration holdDuration;
  final Widget Function(BuildContext context, double percent) builder;
  final Function()? onHoldCompleted;

  const HoldButtonBuilder({
    required this.builder,
    this.onHoldCompleted,
    this.holdDuration = const Duration(seconds: 3),
    super.key,
  });

  @override
  HoldButtonBuilderState createState() => HoldButtonBuilderState();
}

class HoldButtonBuilderState extends State<HoldButtonBuilder> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: widget.holdDuration);
    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        widget.onHoldCompleted?.call();
        controller.value = 0;
      }
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant HoldButtonBuilder oldWidget) {
    if (oldWidget.holdDuration != widget.holdDuration) {
      controller.duration = widget.holdDuration;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => controller.forward(),
      onTapUp: (_) {
        if (controller.status == AnimationStatus.forward) {
          controller.reverse();
        }
      },
      onTapCancel: () {
        if (controller.status == AnimationStatus.forward) {
          controller.reverse();
        }
      },
      child: widget.builder.call(context, controller.value),
    );
  }
}
