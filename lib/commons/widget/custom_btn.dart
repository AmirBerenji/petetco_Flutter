import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.width,
    required this.height,
    this.color,
    required this.borderColor,
    required this.text,
    this.icon,
    this.isDrabble,
  });

  final void Function()? onTap;
  final double width;
  final double height;
  final Color? color;
  final Color borderColor;
  final Text text;
  final Icon? icon;
  final bool? isDrabble;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  bool _hasFlickered = false;
  bool _isFlickering = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 0.2).animate(_controller);
  }

  Future<void> _handleTap() async {
    if (widget.isDrabble == true && !_hasFlickered) {
      setState(() {
        _isFlickering = true;
      });

      // Run flicker animation once
      await _controller.forward();
      await _controller.reverse();

      setState(() {
        _isFlickering = false;
        _hasFlickered = true;
      });
    }

    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildButtonContent() {
    final button = Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: widget.borderColor),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) widget.icon!,
            if (widget.icon != null) const Gap(10),
            widget.text,
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: _handleTap,
      child: _isFlickering
          ? FadeTransition(opacity: _opacityAnimation, child: button)
          : button,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildButtonContent();
  }
}
