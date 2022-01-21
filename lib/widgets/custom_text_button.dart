import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  const CustomTextButton({
    Key? key,
    required this.func,
    required this.title,
    required this.value,
  }) : super(key: key);

  final VoidCallback func;
  final String title;
  final String value;

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: widget.func,
      child: Text(
        widget.title,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 18,
              fontWeight: widget.value == widget.title ? FontWeight.bold : null,
              color: widget.value == widget.title
                  ? Colors.purple
                  : Colors.purple.shade300,
            ),
      ),
    );
  }
}
