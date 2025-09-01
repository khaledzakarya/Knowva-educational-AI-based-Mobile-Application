// gradient_otp_field.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knowva/core/utils/my_colors.dart';

class GradientOtpField extends StatefulWidget {
  final int length;
  final ValueChanged<String> onCompleted;
  final Gradient gradient;
  final double boxMaxSize;
  final TextStyle? textStyle;
  final EdgeInsets boxMargin;
  final double boxRadius;
  final Color boxBackgroundColor; // inner background behind gradient border

  const GradientOtpField({
    super.key,
    this.length = 6,
    required this.onCompleted,
    required this.gradient,
    this.boxMaxSize = 64,
    this.textStyle,
    this.boxMargin = const EdgeInsets.symmetric(horizontal: 6),
    this.boxRadius = 12,
    this.boxBackgroundColor = Colors.white,
  }) : assert(length > 0 && length <= 8);

  @override
  // ignore: library_private_types_in_public_api
  _GradientOtpFieldState createState() => _GradientOtpFieldState();
}

class _GradientOtpFieldState extends State<GradientOtpField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get _currentValue =>
      _controllers.map((c) => c.text).join().trimRight();

  void _onChanged(String value, int index) {
    // If user pasted multiple chars into one box — distribute them
    if (value.length > 1) {
      final chars = value.characters.toList();
      int i = index;
      for (final ch in chars) {
        if (i >= widget.length) break;
        _controllers[i].text = ch;
        i++;
      }
      // move focus to next empty
      final next = chars.length + index;
      if (next < widget.length) {
        _focusNodes[next].requestFocus();
      } else {
        _focusNodes.last.unfocus();
      }
    } else {
      // single char typed
      if (value.isNotEmpty && index + 1 < widget.length) {
        _focusNodes[index + 1].requestFocus();
      }
      if (value.isEmpty && index - 1 >= 0) {
        // do nothing here; backspace handled in onKey
      }
    }

    final current = _currentValue;
    if (current.length == widget.length && !current.contains('')) {
      widget.onCompleted(current);
      // optionally unfocus last field
      _focusNodes.last.unfocus();
    }
    setState(() {});
  }

  // Build individual single-char input wrapped with gradient border
  Widget _buildBox(BuildContext context, int index, double size) {
    final controller = _controllers[index];
    final focusNode = _focusNodes[index];

    return Container(
      margin: widget.boxMargin,
      width: size,
      height: size,
      decoration: BoxDecoration(
        // Outer gradient border via border radius + gradient background
        gradient: widget.gradient,
        borderRadius: BorderRadius.circular(widget.boxRadius),
      ),
      child: Container(
        // inner padding to create border thickness effect
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: widget.boxBackgroundColor,
          borderRadius: BorderRadius.circular(widget.boxRadius - 2),
        ),
        child: Center(
          child: RawKeyboardListener(
            focusNode: FocusNode(), // required for onKey support
            onKey: (event) {
              // handle backspace navigation
              if (event is RawKeyDownEvent &&
                  event.logicalKey == LogicalKeyboardKey.backspace) {
                if (controller.text.isEmpty && index > 0) {
                  _focusNodes[index - 1].requestFocus();
                  _controllers[index - 1].selection = TextSelection.collapsed(
                    offset: _controllers[index - 1].text.length,
                  );
                }
              }
            },
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              textAlign: TextAlign.center,
              cursorColor: MyColors.primaryColor,
              style:
                  widget.textStyle ??
                  Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
              keyboardType: TextInputType.number,
              textInputAction: index + 1 == widget.length
                  ? TextInputAction.done
                  : TextInputAction.next,
              maxLength: 1,
              inputFormatters: [
                FilteringTextInputFormatter.singleLineFormatter,
                LengthLimitingTextInputFormatter(1),
              ],
              decoration: const InputDecoration(
                counterText: '',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                isCollapsed: true,
                contentPadding: EdgeInsets.zero,
              ),
              onChanged: (v) => _onChanged(v, index),
              onTap: () {
                controller.selection = TextSelection.collapsed(
                  offset: controller.text.length,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Adaptive size: use available width to pick a box size (responsive)
    final screenWidth = MediaQuery.of(context).size.width;
    // reserve some space for margins and paddings
    final totalMargins = (widget.length * (widget.boxMargin.horizontal));
    final available = screenWidth - totalMargins - 40; // some side padding
    final rawSize = available / widget.length;
    final size = rawSize > widget.boxMaxSize ? widget.boxMaxSize : rawSize;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.length,
        (i) => _buildBox(context, i, size),
      ),
    );
  }
}
