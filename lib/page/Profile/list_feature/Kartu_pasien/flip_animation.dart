import 'package:flutter/material.dart';

class FlipCardController {
  _FlipCardWidgetState? _state;
  Future flipCard() async => _state?.flipCard();
}

class FlipCardWidget extends StatefulWidget {
  final FlipCardController controller;
  final Widget front; 
  final Widget back;

  const FlipCardWidget({
    super.key,
    required this.front,
    required this.back,
    required this.controller,
  });
  
  @override
  State<FlipCardWidget> createState() => _FlipCardWidgetState();
}

class _FlipCardWidgetState extends State<FlipCardWidget> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isFront = true;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    widget.controller._state = this;
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Future flipCard() async {
    setState(() {
      isFront = !isFront;
    });
    await controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final angle = controller.value * -3.14;
        final transform = Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(angle);
        return Transform(alignment: Alignment.center, transform: transform, child: widget.back);
      });
}
